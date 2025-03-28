#1
import csv
for line in csv.reader(open('Py\hw7\mountfall.csv', encoding='utf-8')):
    if("CMSCI" in line[0]):
        print(line[0], line[9], line[10], line[11], line[12])
    #print(line)