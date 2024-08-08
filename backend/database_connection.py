import json
import mysql.connector

with open('./config.json') as config_file:
    data = json.load(config_file)

application_query_store = mysql.connector.connect(
    host=data['database']['host'],
    user=data['database']['user'],
    password=data['database']['password'],
    database="ApplicationQueryStore"
)

application_knowledge_base = mysql.connector.connect(
    host=data['database']['host'],
    user=data['database']['user'],
    password=data['database']['password'],
    database="ApplicationKnowledgeBase"
)
