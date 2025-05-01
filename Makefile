# Caminho para o docker-compose
COMPOSE_FILE = ./srcs/docker-compose.yml

# Iniciar os serviços
up:
	docker-compose -f $(COMPOSE_FILE) up -d --build

# Parar os serviços
down:
	docker-compose -f $(COMPOSE_FILE) down

# Limpar volumes e imagens
clean:
	docker system prune -a --volumes -f

# Reiniciar os serviços
re:
	make down
	make up