#!/usr/bin/python

from time import localtime, strftime
import bisect

minLookup=[
	' ',
	'Five',
	'Ten',
	'Quarter',
	'Twenty',
	'Twenty-five',
	'Half-past'
]
hourLookup=[
	'Midnight',
	'One',
	'Two',
	'Three',
	'Four',
	'Five',
	'Six',
	'Seven',
	'Eight',
	'Nine',
	'Ten',
	'Eleven',
	'Twelve'
]

#Get minutes
time_min = strftime("%M", localtime())
#Get hour, as int
time_hour = int(strftime("%H", localtime()))

#round minutes to nearest 5, return as int
time_min = int(round(float(time_min)*2,-1)/2)

#Make it 12 hour, rather than 24
if time_hour >= 13:
	time_hour = time_hour - 12

#Get the O'Clock for if it's around 0mins past
if time_min == 0:
	message = hourLookup[time_hour] + " O'Clock"
elif time_min == 60:
	message = hourLookup[time_hour+1] + " O'Clock"
#If it's less than half past, it'll be past
elif time_min <= 30:
	message = minLookup[int(time_min/5)] + " past " + hourLookup[time_hour]
#otherwise it'll be to, you need to invert the minutes and add on an hour
#	so 35 past 12 becomes: 25 to 1
else:
	if time_hour == 12:
		time_hour = 0
	message = minLookup[int((60-time_min)/5)] + " to " + hourLookup[time_hour+1]

print(message + ', ' + strftime("%a %b %-d", localtime()))
