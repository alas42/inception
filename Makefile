# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: avogt <avogt@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/06/09 14:43:54 by avogt             #+#    #+#              #
#    Updated: 2021/06/19 16:28:14 by avogt            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

APP_NAME = inception
SRCS_FOLDER = ./srcs
COMPOSE_FILE = $(addprefix $(SRCS_FOLDER)/,docker-compose.yml)
LOGIN = avogt
HTML_FOLDER = /home/$(LOGIN)/data/html
DB_FOLDER = /home/$(LOGIN)/data/mysql

firstsetup: setup up

up:
	cd $(SRCS_FOLDER) && docker-compose build
	cd $(SRCS_FOLDER) && docker-compose up -d

setup:
	sudo sh ./srcs/requirements/tools/modify_etc_hosts.sh add avogt.42.fr
	sudo useradd -u 1003 www-a42
	sudo mkdir -p $(DB_FOLDER)
	sudo mkdir -p $(HTML_FOLDER)
	sudo chown mysql:mysql $(DB_FOLDER)
	sudo chown www-a42:www-a42 $(HTML_FOLDER)

rmsetup:
	sudo sh ./srcs/requirements/tools/modify_etc_hosts.sh remove avogt.42.fr
	sudo userdel www-a42
	sudo rm -rf $(DB_FOLDER)
	sudo rm -rf $(HTML_FOLDER)

resetup: rmsetup setup

stop:
	cd $(SRCS_FOLDER) && docker-compose stop

down: stop
	cd $(SRCS_FOLDER) && docker-compose down --rmi all

delete: down rmsetup
	docker volume rm $(shell docker volume ls -q) 2>/dev/null

check:
	@docker-compose -f $(COMPOSE_FILE) ps -a

re: delete firstsetup

.PHONY: up stop re check delete down rmsetup setup resetup firstsetup
