PHONY: up
up:
	docker-compose up -d

PHONY: os-deps
os-deps:
	sudo apt install erlang-inets erlang-os-mon erlang-runtime-tools erlang-ssl
