from azure_connection import project_name, deployment_name, client
from database_connection import application_knowledge_base as db
import uuid


def search_knowledge_base(intent: str):
    cursor = db.cursor()
    sql = "SELECT * FROM Response WHERE intent = %s"
    cursor.execute(sql, (intent,))
    result = cursor.fetchone()
    cursor.close()
    return result[2]


def azure_request(user_query: str, participant_id: str):
    return {
        "kind": "Conversation",
        "analysisInput": {
            "conversationItem": {
                "participantId": str(participant_id),
                "id": str(uuid.uuid4()),
                "modality": "text",
                "language": "en-gb",
                "text": user_query
            },
            "isLoggingEnabled": False
        },
        "parameters": {
            "projectName": project_name,
            "deploymentName": deployment_name,
            "verbose": True
        }
    }


def parse_response(response):
    prediction = response['result']['prediction']
    top_intent = prediction['topIntent']
    intents = prediction['intents']
    parsed_intents = [{"category": intent['category'], "confidenceScore": intent['confidenceScore']} for intent in
                      intents]
    return {
        "query": response['result']['query'],
        "topIntent": top_intent,
        "intents": parsed_intents
    }


def generate_response(user_query: str, participant_id: str):
    response = client.analyze_conversation(task=azure_request(user_query, participant_id))
    parsed_result = parse_response(response)
    if parsed_result['intents']:
        intent = parsed_result['intents'][0]
        return search_knowledge_base(intent["category"])
    else:
        return "No Answer Found"
