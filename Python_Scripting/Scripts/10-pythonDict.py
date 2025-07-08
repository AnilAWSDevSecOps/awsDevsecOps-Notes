# list inside a list in a dictionary
# # Example
# # The values in the dictionary can be of any data type:
dict1 = {
    "brand": "Ford",
    "electric": False,
    "year": 1964,
    "colors": ["red", "white", "blue"],
    "services": [
        {"IaaS":["AWS", "Azure", "GCP"]},
        {"PaaS":["RDS", "DyDB", "EB"]},
        {"SaaS":["Chime", "Mail", "Xyz"]}
    ]
}

print(type(dict1))
print(dict1)
print(dict1["services"])
print(dict1["services"][0])
print(dict1["services"][1])
print(dict1["services"][2])
print(dict1["services"][0]["IaaS"])
print(dict1["services"][1]["PaaS"])
print(dict1["services"][2]["SaaS"])
print(dict1["services"][0]["IaaS"][0])
print(dict1["services"][0]["IaaS"][1])
print(dict1["services"][0]["IaaS"][2])
print(dict1["services"][1]["PaaS"][0])
print(dict1["services"][1]["PaaS"][1])
print(dict1["services"][1]["PaaS"][2])
print(dict1["services"][2]["SaaS"][0])
print(dict1["services"][2]["SaaS"][1])
print(dict1["services"][2]["SaaS"][2])

for key, value in dict1.items():
    print(key, value)
    if key == "services":
        for i in value:
            for k, v in i.items():
                print(k, v)
                for j in v:
                    print(j)
    else:
        print(value)

# Output
'''
<class 'dict'>
{'brand': 'Ford', 'electric': False, 'year': 1964, 'colors': ['red', 'white', 'blue'], 'services': [{'IaaS': ['AWS', 'Azure', 'GCP']}, {'PaaS': ['RDS', 'DyDB', 'EB']}, {'SaaS': ['Chime', 'Mail', 'Xyz']}]}
[{'IaaS': ['AWS', 'Azure', 'GCP']}, {'PaaS': ['RDS', 'DyDB', 'EB']}, {'SaaS': ['Chime', 'Mail', 'Xyz']}]
{'IaaS': ['AWS', 'Azure', 'GCP']}
{'PaaS': ['RDS', 'DyDB', 'EB']}
{'SaaS': ['Chime', 'Mail', 'Xyz']}
['AWS', 'Azure', 'GCP']
['RDS', 'DyDB', 'EB']
['Chime', 'Mail', 'Xyz']
AWS
Azure
GCP
RDS
DyDB
EB
Chime
Mail
Xyz
brand Ford
electric False
year 1964
colors ['red', 'white', 'blue']
services [{'IaaS': ['AWS', 'Azure', 'GCP']}, {'PaaS': ['RDS', 'DyDB', 'EB']}, {'SaaS': ['Chime', 'Mail', 'Xyz']}]
IaaS ['AWS', 'Azure', 'GCP']
AWS
Azure
GCP
PaaS ['RDS', 'DyDB', 'EB']
RDS
DyDB
EB
SaaS ['Chime', 'Mail', 'Xyz']
Chime
Mail
Xyz
'''