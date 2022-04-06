IMAGE_NAME=sineverba/testphp8xc
CONTAINER_NAME=testphp8xc


build:
	docker build --tag $(IMAGE_NAME) .

multiple:
	# docker login --username=sineverba
	mkdir -vp ~/.docker/cli-plugins/
    curl --silent -L "https://github.com/docker/buildx/releases/download/v0.6.3/buildx-v0.6.3.linux-amd64" > ~/.docker/cli-plugins/docker-buildx
	chmod a+x ~/.docker/cli-plugins/docker-buildx
	docker buildx version
	docker run --rm --privileged tonistiigi/binfmt:qemu-v6.1.0 --reset -p yes
	docker buildx create --name mybuilder && docker buildx use mybuilder && docker buildx inspect --bootstrap
	# docker buildx build --tag sineverba/php8xc:latest --tag sineverba/php8xc:1.9.0 --platform linux/386,linux/amd64,linux/arm/v6,linux/arm/v7,linux/arm64 --push .
	docker buildx build --tag sineverba/php8xc:latest --tag sineverba/php8xc:1.9.0 --platform linux/amd64,linux/armhf,linux/arm64 --push .

test:
	@docker run --rm $(IMAGE_NAME) php -v | grep 8.1.4
	@docker run --rm $(IMAGE_NAME) php -v | grep OPcache
	@docker run --rm $(IMAGE_NAME) php -m | grep xdebug
	@docker run --rm $(IMAGE_NAME) php -r "xdebug_info();" | grep "3.1.4"
	@docker run --rm $(IMAGE_NAME) php -m | grep pdo_pgsql
	@docker run --rm $(IMAGE_NAME) php -m | grep zip
	@docker run --rm $(IMAGE_NAME) /usr/bin/composer -V | grep "2.3.3"
	@docker run --rm $(IMAGE_NAME) php -i | grep "short_open_tag => Off => Off"
	@docker run --rm $(IMAGE_NAME) php -i | grep "memory_limit => 512M => 512M"

destroy:
	docker image rm $(IMAGE_NAME)
