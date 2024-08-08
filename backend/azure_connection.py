import json
from azure.core.credentials import AzureKeyCredential
from azure.ai.language.conversations import ConversationAnalysisClient

with open('./config.json') as config_file:
    data = json.load(config_file)

endpoint = data["azure"]["endpoint"]
credential = AzureKeyCredential(data["azure"]["credential"])

project_name = data["azure"]["project_name"]
deployment_name = data["azure"]["deployment_name"]
client = ConversationAnalysisClient(endpoint, credential)
