all: build


build:
	sudo docker compose -f srcs/docker-compose.yml up -d --build

start:
	sudo docker compose -f srcs/docker-compose.yml start

stop:
	sudo docker compose -f srcs/docker-compose.yml stop

restart: clean build

clean:
	sudo docker compose -f srcs/docker-compose.yml down -v

fclean:
	sudo rm -rf /home/axcallet/data/*/*
	docker system prune -af