# Importing boto3 module from boto3 package
import boto3

# Importing requests module from requests package
import requests

# Importing FastAPI module from fastapi package
from fastapi import FastAPI

# Creating an instance of FastAPI class
app = FastAPI()

# Creating a home page for the FastAPI application
@app.get('/')
def home():
    return {
        "message": "Welcome to the Python Practice with FastAPI",
        "description": "This is a simple FastAPI application",
        "author": "Anil Kumar Reddy",
        "month": "September",
        "year": 2024
    }

@app.get('/pokemon')
def get_pokemon():
    pokemon_list = []
    get_data = requests.get('https://pokeapi.co/api/v2/pokemon?limit=5&offset=10')
    for i in get_data.json()['results']:
        pokemon_list.append(i['name'])
    return pokemon_list

@app.get('/vpcs/{region}')
def get_vpcs(region: str):
    vpc_list = []
    ec2 = boto3.client('ec2', region_name=region)
    for vpc in ec2.describe_vpcs()['Vpcs']:
        vpc_list.append(vpc['VpcId'])
    return vpc_list
