# ebusd

# Options to pass to ebusd (run "ebusd -?" for more info):
EBUSD_OPTS="--pollinterval=1 --httpport 8085 --scanconfig --mqtthost=192.168.3.67 --mqttport=1883 --enablehex  -d 192.168.3.35:5000 --loglevel=info"

docker run --rm -it -p 8888 john30/ebusd -f --scanconfig -d udp:192.168.178.123:10000 --latency=80000

docker run -d --name=ebusd --device=/dev/ttyUSB0 -p 8888 john30/ebusd -f --scanconfig -d /dev/ttyUSB0 --mqttport=1883 --mqtthost=BROKERHOST
