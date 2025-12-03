DOCKER_COMPOSE := srcs/docker-compose.yml

GREEN := \033[0;32m
NC := \033[0m

all: build up
	@echo "$(GREEN)All done!$(NC)"

build:
	@echo "$(GREEN)Building all Docker images...$(NC)"
	docker compose -f $(DOCKER_COMPOSE) build

up:
	@echo "$(GREEN)Starting all containers...$(NC)"
	docker compose -f $(DOCKER_COMPOSE) up -d

down:
	@echo "$(GREEN)Stopping all containers...$(NC)"
	docker compose -f $(DOCKER_COMPOSE) down

down-v:
	@echo "$(GREEN)Stopping containers and removing volumes...$(NC)"
	docker compose -f $(DOCKER_COMPOSE) down -v

re: down-v build up
	@echo "$(GREEN)Rebuilt and started all containers.$(NC)"

# Проверка статуса контейнеров
ps:
	docker compose -f $(DOCKER_COMPOSE) ps

clean:
	@echo "$(GREEN)Stopping and removing all containers...$(NC)"
	docker compose -f $(DOCKER_COMPOSE) down --remove-orphans

fclean:
	@echo "$(GREEN)Cleaning up all containers, networks, images and volumes...$(NC)"
	docker compose -f $(DOCKER_COMPOSE) down -v --rmi all --remove-orphans

.PHONY: build up down down-v re ps clean fclean
