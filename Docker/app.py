import json
from selenium import webdriver

def lambda_handler(event, context):

    driver = webdriver.Chrome(executable_path='/opt/chromedriver/96.0.4664.45/chromedriver_linux64')

    driver.get("https://www.google.co.uk")
    print(driver.title)

    return {
    "statusCode": 200,
        "headers": {
            "Content-Type": "application/json"
        },
        "body": json.dumps({
            "title ": driver.title
        })
    }
