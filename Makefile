dev: build 
	docker-compose up

build: Dockerfile docker-compose.yml 
	docker-compose build app

deploy: build deploy-gunicorn

deploy-gunicorn: build
	docker-compose -f docker-compose.yml -f deploy/gunicorn.yml up

deploy-uwsgi: build
	docker-compose -f docker-compose.yml -f deploy/uwsgi.yml up

down:
	docker-compose down
