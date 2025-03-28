#4
import requests
import xml.etree.ElementTree as ET

text = requests.get("https://forecast.weather.gov/MapClick.php?lat=39.7027&lon=-77.327&unit=0&lg=english&FcstType=dwml").text
#print(text) debug
v = ET.fromstring(text) 
#print(v) debug
params = v.find("data").find("parameters").find("wordedForecast")
#print(params) debug

for f in params.findall("text"):
    print(f.text)