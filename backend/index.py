from fastapi import FastAPI, HTTPException
import json
from application_query_store import store_query, store_response, store_feedback
from application_knowledge_base import generate_response

app = FastAPI()


@app.get("/query")
async def query(user_query: str, participant_id: str):
    try:
        query_id = store_query(user_query)
        response = generate_response(user_query, participant_id)
        store_response(response, query_id)
        return json.dumps({"response": response, "query_id": query_id})
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))


@app.post("/feedback")
async def feedback(rating: int, comment: str, query_id: int):
    try:
        store_feedback(rating, comment, query_id)
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
