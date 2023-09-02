
build:
	docker-compose build

install:
	docker-compose run api bundle install

setup:
	make build install

down-rmi:
	docker-compose down && docker rmi scraping_api_api --force

reset:
	make down-rmi setup

up:
	docker-compose up

scale_up:
	docker-compose up --scale sidekiq=3

console:
	docker-compose exec api bundle exec rails c

bash:
	docker-compose exec api bash

tests:
	docker-compose exec api bundle exec rspec spec

rubocop:
	docker-compose exec api bundle exec rubocop

api-clean:
	docker-compose down

restore-permission:
	sudo chown -R $USER:$USER .