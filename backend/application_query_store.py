from database_connection import application_query_store as db


def store_query(query_text: str):
    cursor = db.cursor()
    sql = "INSERT INTO Query (QueryText) VALUES (%s)"
    cursor.execute(sql, (query_text,))
    db.commit()
    query_id = cursor.lastrowid
    cursor.close()
    return query_id


def store_response(response_text: str, query_id: int):
    cursor = db.cursor()
    sql = "INSERT INTO Response (ResponseText, QueryId) VALUES (%s, %s)"
    cursor.execute(sql, (response_text, query_id))
    db.commit()
    cursor.close()


def store_feedback(rating: int, comments: str, query_id: int):
    cursor = db.cursor()
    sql = "INSERT INTO Feedback (Rating, Comments, QueryId) VALUES (%s, %s, %s)"
    cursor.execute(sql, (rating, comments, query_id))
    db.commit()
    cursor.close()
