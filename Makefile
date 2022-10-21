IMAGE_NAME=sineverba/php8xc
CONTAINER_NAME=php8xc
VERSION=1.10.0-dev


build:
	docker build --tag $(IMAGE_NAME):$(VERSION) .

test:
	docker run --rm $(IMAGE_NAME):$(VERSION) php -v | grep 8.1.11
	docker run --rm $(IMAGE_NAME):$(VERSION) php -v | grep OPcache
	docker run --rm $(IMAGE_NAME):$(VERSION) php -m | grep xdebug
	docker run --rm $(IMAGE_NAME):$(VERSION) php -r "xdebug_info();" | grep "3.1.5"
	docker run --rm $(IMAGE_NAME):$(VERSION) php -m | grep pdo_pgsql
	docker run --rm $(IMAGE_NAME):$(VERSION) php -m | grep zip
	docker run --rm $(IMAGE_NAME):$(VERSION) /usr/bin/composer -V | grep "2.4.3"
	docker run --rm $(IMAGE_NAME):$(VERSION) php -i | grep "short_open_tag => Off => Off"
	docker run --rm $(IMAGE_NAME):$(VERSION) php -i | grep "memory_limit => 512M => 512M"

destroy:
	docker image rm $(IMAGE_NAME):$(VERSION)
