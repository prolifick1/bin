from datetime import datetime
from suntime import Sun, SunTimeException
import subprocess

lat = 44.38
long = -89.81

sun = Sun(lat, long)

today_sr = sun.get_local_sunrise_time().strftime('%H:%M:%S')
today_ss = sun.get_local_sunset_time().strftime('%H:%M:%S')

now = datetime.now()

current_time = now.strftime('%H:%M:%S')

#if between dusk and sunset, brightness 1
if(current_time > today_sr and current_time < today_ss):
    print(f"current time: {current_time} sr: {today_sr} ss: {today_ss}")
    subprocess.check_call(['/usr/local/bin/brightness', '-m', '1'])

#if it's between sunset and dusk, brightness 0.05
if((current_time > today_ss) or (current_time < today_sr)):
    print(f"current time: {current_time} sr: {today_sr} ss: {today_ss}")
    subprocess.check_call(['/usr/local/bin/brightness', '-m', '0.05'])  
