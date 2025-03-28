#4
import requests
import xml.etree.ElementTree as ET

text = requests.get("https://forecast.weather.gov/MapClick.php?lat=39.7027&lon=-77.327&unit=0&lg=english&FcstType=dwml%27).text").text
#v = ET.fromstring(text) #this causes an error. How am I supposed to do this? This is not explained in class.
#print(text)