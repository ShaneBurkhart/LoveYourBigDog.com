NAME=loveyourbigdog.com
IMAGE_TAG=shaneburkhart/${NAME}

all: run

build:
	 docker build -t ${IMAGE_TAG} -f Dockerfile .

run:
	docker-compose -f docker-compose.dev.yml up -d

stop:
	docker-compose -f docker-compose.dev.yml down

logs:
	docker-compose -f docker-compose.dev.yml logs -f

ps:
	docker-compose -f docker-compose.dev.yml ps

gulp_c:
	docker run -it ${IMAGE_TAG} /bin/bash

gulp_build:
	docker run -v $(shell pwd)/views:/app/views -v $(shell pwd)/public:/app/public ${IMAGE_TAG}

gulp_watch:
	docker run -v $(shell pwd)/views:/app/views -v $(shell pwd)/public:/app/public ${IMAGE_TAG} rerun --background --pattern '*.pug' rake gulp_build

deploy:
	ssh -A loveyourbigdogcom 'cd ~/LoveYourBigDog.com; git pull origin master; ./prod.sh'

