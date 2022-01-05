import json
from selenium import webdriver
from tempfile import mkdtemp

def lambda_handler(event, context):

    options = webdriver.ChromeOptions()
    options.binary_location = '/opt/chrome/chrome'
    options.add_argument('--headless')
    options.add_argument('--no-sandbox')
    options.add_argument("--disable-gpu")
    options.add_argument("--window-size=1280x1696")
    options.add_argument("--single-process")
    options.add_argument("--disable-dev-shm-usage")
    options.add_argument("--disable-dev-tools")
    options.add_argument("--no-zygote")
    options.add_argument(f"--user-data-dir={mkdtemp()}")
    options.add_argument(f"--data-path={mkdtemp()}")
    options.add_argument(f"--disk-cache-dir={mkdtemp()}")
    options.add_argument("--remote-debugging-port=9222")

    chrome = webdriver.Chrome(executable_path="/opt/chromedriver", options=options)

    chrome.get("https://www.example.com")
    print(chrome.title)

    return {
    "statusCode": 200,
        "headers": {
            "Content-Type": "application/json"
        },
        "body": json.dumps({
            "title ": chrome.title
        })
    }
