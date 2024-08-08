import unittest
from unittest.mock import patch
from uuid import uuid4
from azure_connection import client
from application_knowledge_base import search_knowledge_base, azure_request, parse_response
from application_query_store import store_query, store_response, store_feedback


class TestApplicationKnowledgeBase(unittest.TestCase):
    @patch('application_knowledge_base.db.cursor')
    def test_search_knowledge_base(self, mock_cursor):
        mock_cursor.return_value.execute.return_value = None
        mock_cursor.return_value.fetchone.return_value = [1, 'test_intent', 'test_response']

        result = search_knowledge_base('test_intent')

        mock_cursor.return_value.execute.assert_called_once_with("SELECT * FROM Response WHERE intent = %s",
                                                                 ('test_intent',))
        self.assertEqual(result, 'test_response')

    def test_azure_request(self):
        user_query = 'test query'
        participant_id = str(uuid4())

        result = azure_request(user_query, participant_id)

        # Assert
        self.assertEqual(result['kind'], 'Conversation')
        self.assertEqual(result['analysisInput']['conversationItem']['text'], user_query)
        self.assertEqual(result['analysisInput']['conversationItem']['participantId'], participant_id)

    def test_intent_recognition(self):
        user_query = 'How can I get a student visa?'
        participant_id = str(uuid4())

        response = client.analyze_conversation(task=azure_request(user_query, participant_id))
        parsed_result = parse_response(response)
        intent = parsed_result['intents'][0]

        self.assertEqual(intent['category'], 'StudentVisaAttain')


class TestApplicationQueryStore(unittest.TestCase):

    @patch('application_query_store.db.cursor')
    def test_store_query(self, mock_cursor):
        mock_cursor.return_value.lastrowid = 1

        result = store_query('test_query')

        mock_cursor.return_value.execute.assert_called_once_with("INSERT INTO Query (QueryText) VALUES (%s)",
                                                                 ('test_query',))
        self.assertEqual(result, 1)

    @patch('application_query_store.db.cursor')
    def test_store_response(self, mock_cursor):
        store_response('test_response', 1)

        mock_cursor.return_value.execute.assert_called_once_with(
            "INSERT INTO Response (ResponseText, QueryId) VALUES (%s, %s)", ('test_response', 1))

    @patch('application_query_store.db.cursor')
    def test_store_feedback(self, mock_cursor):
        store_feedback(5, 'I liked the answer', 1)

        mock_cursor.return_value.execute.assert_called_once_with(
            "INSERT INTO Feedback (Rating, Comments, QueryId) VALUES (%s, %s, %s)", (5, 'I liked the answer', 1))


if __name__ == '__main__':
    unittest.main()
