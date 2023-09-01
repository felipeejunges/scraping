
# Scraping

This project collects data from Open Food Facts website through a background service, formatting the data and then showing this data through API.

## Technologies

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

## Instructions

This instructions shows how to initialize the project and using it with docker

- Run command `docker-compose build` to configure the project
- Run command `docker-compose up` to initialize the project
- You can test the API's with swagger documentation on http://localhost:3000/api-docs/index.html (if you're running it locally)
- You can run tests, to do this, you have to be inside docker bash container with command `rspec spec/controllers/`

## Project presentation
Link with project presentation: https://www.loom.com/embed/e563e0e8c7e94946a2fb1123d3f16093 (the explanation is on portuguese)

