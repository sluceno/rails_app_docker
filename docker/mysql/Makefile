CONTAINER=$(docker ps | grep mysql | awk '{print $$1}')
IP=$(docker inspect --format='{{.NetworkSettings.IPAddress}}' $CONTAINER)
BLA="Hola"

build:
	docker build -t mysql .

run:
	docker run -d -p 3306:3306 -e USERNAME=admin -e PASSWORD=sergio mysql

connect:
	docker exec -it $$(docker ps | grep mysql | awk '{print $$1}') bash

remove:
	docker rm -f $$(docker ps | grep mysql | awk '{print $$1}')

ip:
	docker ps | grep mysql | awk '{print $$1}'

misc:
	# docker ps | grep mysql | awk '{print $$1}'
	@echo ${CONTAINER}

