
# Immigration Advisor Chatbot

Please view report for information about this project. This document is to inform you how to set up this application to work locally on your computer. This setup will probably require an hour of free time if starting from fresh.

**Please note that this documentaion has been based on setup for macOS. Some alterations for Windows and Linux machines may be required.**

# Requirements
- Node.js Version 20.16 (LTM): Node.js can be installed from the official Node.js [website](https://nodejs.org/en), or through [Node Version Manager](https://github.com/nvm-sh/nvm) which is the method that I would recommend
- Python Version 3.13: Python can be installed from the official Python [website](https://www.python.org/downloads/)
- MySQL Version 8.3.0: MySQL can be installed from the official MySQL [website](https://www.mysql.com). I would also recommend installing MySQL workbench so that you can see records in tables.
- Microsoft Azure account: Please note that you are required to have a payment method and Microsoft Account to open a Microsoft Azure account. You can create an account at https://portal.azure.com/.

# Azure AI Language Setup
1. Setup your Microsoft Azure account at https://portal.azure.com/.
2. Search for Language in the search bar and press on to it to open the Azure AI Language service.
3. Press the "create" button in the top left.
4. Press "Continue to create your resource".
5. Select your subscription.
6. Under Resource group, select Create new and create a resource group.
7. Set your region to East US.
8. Give your project a name.
9. Select "Free F0" for your pricing tier.
10. Confirm that you will follow Microsoft's Responsible AI Notice and then press the "Review + create" button and create your project.
11. It may take 5 to 10 minutes for your project to be created. Once it is created, open it to view its overview panel.
12. From here, open the "Resource Manage" menu and select "Keys and Endpoint." Make a note of "KEY 1" and "Endpoint." You will need this later.
13. Go back to the "Overview" menu and press "Get started with Language Studio." This will redirect you to a new website. You may need to log back in. Once logged in, select your Azure directory, Azure subcription, make sure Resource type is set to "Language" and then select the Resource you just created under the Resource name drop down.
14. Press the "Create new" dropdown and then press "Conversational language understanding"
15. Give the project a name and set the utterances primary language to English UK. Then press Next and create the project. You should automatically enter the menu for the created project.
16. Next you will need to make sure you in the "Schema definition" page and in the intents section. From here you will need to manually add all the intents required. You can find all these intents in intents/intent_names.txt.
17. Move to the data labeling section and make sure you're in the training set section. From here, press upload utterance file and upload the intents.json found in the intents directory.
18. Next move to the Training jobs section and start a training job. Press train a new model and give the model a name. For training mode select "Advanced training." Leave everything else the same and press the train button. This training could take up to thirty minutes. Once your model is created, it should be available in the Model performance section.
19. Once the model is created, move to the Deploying a model section and press "Add deployment." Create a new deployment and give it a name. Select the model you just created and then press deploy. This is the end of this section.

# MySQL Setup
1. I would recommend following this guide from Digital Ocean on setting up MySQL 8: https://www.digitalocean.com/community/tutorial-collections/how-to-install-mysql.
2. Create two new databases called ApplicationQueryStore and ApplicationKnowledgeBase.
3. Use the schema files found in schema/ to create the schema for the respected database.

# Backend Setup
1. Make sure you have Python installed.
2. You will need to install the `fastapi`, `azure-core`, and `mysql-connector-package` packages using pip to continue.
3. Using `example.config.json`, create a new file caleld `config.json` and fill in the required details.
4. (Optional) If you want to check if everything has been set up correctly, you can use the unit tests.
5. To start the backend, run `fastapi dev index.py` (Or `fastapi index.py`).

# Frontend Setup
1. In your local environment, create a new variable called `CHATBOT_API_DOMAIN` and set it to `http://localhost:8000/`. E.g: `export CHATBOT_API_DOMAIN="http://localhost:8000/"`
2. Run `npm install` in the frontend directory to install all required dependencies.
3. Run `npm run build` to create the project.
4. Once built, you can then use `npm run start` to start the frontend site locally.
5. Assuming all the previous steps were completed succesfully, everything should be working.