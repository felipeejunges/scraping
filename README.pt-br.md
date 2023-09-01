
# Scraping
[![en](https://img.shields.io/badge/lang-en-red.svg)](https://github.com/felipeejunges/scraping/blob/master/README.md)

O projeto coleta os dados do site Open Food Facts através de um serviço de background, formata o dado e então exibe através de um API.

## Tecnologias

- Ruby v3.2.1
- Ruby on Rails v6.1.7
- MongoDB (Atlas)
- Docker
- Sidekiq
- Swagger (rswag)
- Rspec
- FactoryBot
- Faker
- Mechanize
- Nokigiri
- Kaminari
- CircleCI

## Instruções

Estas instruções abordará a inicialização do projeto e utilização do mesmo atráves do docker

- Rodar o comando `docker-compose build` para configurar o projeto
- Rodar o comando `docker-compose up` para inicializar o projeto
- Você pode testar as API's através da documentação do swagger no link http://localhost:3000/api-docs/index.html (caso esteja rodando no local)
- Para rodar os testes, é precisar estar dentro do bash do docker ou de onde o projeto está rodando e utilizar o comando `rspec spec/controllers/`

## Apresentação do projeto
Link com vídeo da apresentação do projeto: https://www.loom.com/embed/e563e0e8c7e94946a2fb1123d3f16093

