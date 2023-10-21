# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: zmoussam <zmoussam@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/10/20 13:00:31 by zmoussam          #+#    #+#              #
#    Updated: 2023/10/20 15:59:25 by zmoussam         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Color variables
GREEN=\033[0;32m
NC=\033[0m

all:
	@echo "$(GREEN)Building... \nPlease wait a few seconds !$(NC)"
	@mkdir -p /home/zmoussam/data
	@mkdir -p /home/zmoussam/data/wordpress
	@mkdir -p /home/zmoussam/data/database
	@docker-compose -f ./srcs/docker-compose.yml up -d --build > /dev/null
	@echo "$(GREEN)Building done, you can now access the services !$(NC)"

clean:
	@echo "$(GREEN)Cleaning... \nPlease wait a few seconds !$(NC)"
	@docker-compose -f ./srcs/docker-compose.yml down > /dev/null
	@echo "$(GREEN)Cleaning done !$(NC)"

fclean:
	@echo "$(GREEN)Cleaning and removing all volumes... \nPlease wait a few seconds !$(NC)"
	@docker-compose -f ./srcs/docker-compose.yml down --rmi all --volumes > /dev/null
	@sudo rm -rf /home/zmoussam/data
	@echo "$(GREEN)Cleaning and removing all volumes done !$(NC)"

re: fclean all
