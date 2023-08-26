DOMAIN = $(shell awk '/rfelipe-.42.fr/{print $$2}' /etc/hosts)
VOLUMES = $(shell docker volume ls -q)
IMAGES = $(shell docker images -q)

all: hosts
	sudo mkdir -p /home/rfelipe-/data/mysql && sudo mkdir -p /home/rfelipe-/data/wordpress
	cd srcs/ && docker-compose -f docker-compose.yml up -d --build

hosts:
	cp /etc/hosts ./hosts_backup
	sudo rm /etc/hosts
	sudo cp ./srcs/requirements/nginx/tools/hosts /etc/

down:
	cd srcs/ && docker-compose -f docker-compose.yml down

clean: down
ifneq ($(VOLUMES),)
	docker volume rm $(VOLUMES)
endif
ifneq ($(IMAGES),)
	docker rmi $(IMAGES)
endif

fclean: clean
	docker system prune -a --volumes
	sudo mv ./hosts_backup /etc/hosts
	sudo rm -rf /home/rfelipe-

.PHONY: all hosts down clean fclean
