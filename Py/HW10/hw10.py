#2
from random import randint
import time
import json
js = json.loads(open("Py\hw7\hw10.json").read())
names = js["players"]
scores = js["scores"]
name = input('Enter your name: ')
names.append(name)
wrong = 0
start = time.time()
for i in range(5):
    a = randint(3,9)*10 + randint(1,9)
    b = randint(3,9)*10 + randint(1,9)
    ans = input(str(a) + ' + ' + str(b) + ' = ')
    if int(ans) != int(a) + int(b):
        wrong += 1
        print('Wrong')
score = int(10*(round(60 - (time.time()-start) - 10*wrong,1)))
scores.append(score)
#players is names array
#js["players"][0] would be the first player's name, js["scores"][0] would be the first player's score
# that with 1 would be second player's info, etc.
dict = {
    "players": names,
    "scores": scores
}
with open("Py\hw7\hw10.json", "w") as outfile:
    json.dump(dict, outfile)
print(js)