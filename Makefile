DOCKER_COMPOSE := srcs/docker-compose.yml

GREEN := \033[0;32m
NC := \033[0m

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

restart: down-v build up
	@echo "$(GREEN)Restart completed.$(NC)"

# Проверка статуса контейнеров
ps:
	docker compose -f $(DOCKER_COMPOSE) ps

logs:
	docker compose -f $(DOCKER_COMPOSE) logs -f

clean:
	@echo "$(GREEN)Cleaning up all containers, networks, and images...$(NC)"
	docker compose -f $(DOCKER_COMPOSE) down -v --rmi all --remove-orphans

.PHONY: build up down down-v restart ps logs clean
