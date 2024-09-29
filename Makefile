VOLUME_DATA=/home/jbadaire/data
COMPOSE_PATH="./srcs/docker-compose.yml"

all:
	mkdir -p $(VOLUME_DATA)/nginx $(VOLUME_DATA)/mariadb
	docker compose -f $(COMPOSE_PATH) up --build

down:
	docker compose -f $(COMPOSE_PATH) down

clean:
	docker compose -f $(COMPOSE_PATH) down -v --rmi all

fclean: clean
	docker system prune --all --force
	sudo rm -rf $(VOLUME_DATA)

re: fclean all

.PHONY: all down clean fclean re