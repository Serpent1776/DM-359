#3
import requests
import json

txt = requests.get("https://datausa.io/api/data?drilldowns=State&measures=Population").text
js = json.loads(txt)
index = 20
population = []
try:
    while(int(js["data"][index]["Year"]) >= 2013):
        #print(js["data"][index]) debugging
        population.append(js["data"][index]["Population"])
        index += 52
except:
    #print(population) debugging
    year = 2012
    for i in range(len(population)-1, 1, -1):
        if(not(i + 1 == len(population))):
            u = i + 1
            year1 = year + (len(population) - u)
            year2 = year + (len(population) - i)
            pop1 = population[u]
            pop2 = population[i]
            print(year1, end = "-")
            print(year2, end = " +")
            print(pop2-pop1)