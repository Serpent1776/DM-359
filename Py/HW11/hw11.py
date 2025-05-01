import redis    # use pip install redis at the command line to install the Python library for working with Redis
from random import randint
import time
import json


r = redis.Redis(
    host='redis-19187.c240.us-east-1-3.ec2.redns.redis-cloud.com',
    port=19187,
    decode_responses=True,
    username="default",
    password="oLX18ts5wfhLMroSXSw2MKcJkFxsSVsn",
)
try: 
    r.set("gamePlayed-Jack", 0)
except:
    r.incr("gamePlayed-Jack")
try: 
    r.set("gamePlayedToday-Jack", 0)
    r.expire("gamePlayedToday-Jack", 60*60*24)
except:
    r.incr("gamePlayedToday-Jack")
jso = json.loads(open("Py\HW11\hw11.json").read())
jstr = "Current Top Scores\n"
for x in jso["names"]:
    jstr += x + " " + str(jso["scorez"][x]) + "\n"
r.set("Score List-Jack", jstr)
print(r.get("Score List-Jack"))
name = input('Enter your name: ')
wrong = 0
jstr = ""
start = time.time()
for i in range(5):
    a = randint(3,9)*10 + randint(1,9)
    b = randint(3,9)*10 + randint(1,9)
    ans = input(str(a) + ' + ' + str(b) + ' = ')
    if int(ans) != int(a) + int(b):
        wrong += 1
        print('Wrong')
score = int(10*(round(60 - (time.time()-start) - 10*wrong,1)))
jso["scorez"].update({name: score})
listo = jso["names"]
listo.append(name) 
doct = {
    "gameplayed": r.get("gamePlayed-Jack"),
    "gameplayedtoday": r.get("gamePlayedToday-Jack"),
    "scorez": jso["scorez"],
    "names": listo
}
with open("Py\HW11\hw11.json", "w") as outfile:
    json.dump(doct, outfile)

