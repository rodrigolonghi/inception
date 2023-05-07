all:
	bash ./srcs/requirements/tools/create_folders.sh
	docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d

clean:
	docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env down
	./srcs/requirements/tools/stop.sh

fclean: clean
	docker system prune --all --force --volumes
	docker network prune --force
	docker volume prune --force
	sudo rm -rf ~/data

re: fclean all

.PHONE: all clean fclean re
