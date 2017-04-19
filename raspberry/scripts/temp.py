from grovepi import *

dht_sensor_port = 7
dht_sensor_type = 1

[ temp, humidity ] = dht(dht_sensor_port,dht_sensor_type)
print(temp)
