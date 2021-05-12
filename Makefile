build:
	docker build --tag sineverba/testphp8xc .

multiple:
	# docker login --username=sineverba
	mkdir -vp ~/.docker/cli-plugins/
    curl --silent -L "https://github.com/docker/buildx/releases/download/v0.5.1/buildx-v0.5.1.linux-amd64" > ~/.docker/cli-plugins/docker-buildx
	chmod a+x ~/.docker/cli-plugins/docker-buildx
	docker buildx version
	docker run --rm --privileged multiarch/qemu-user-static --reset -p yes
	docker buildx create --name mybuilder && docker buildx use mybuilder && docker buildx inspect --bootstrap
	# docker buildx build --tag sineverba/php8xc:latest --tag sineverba/php8xc:1.1.0 --platform linux/386,linux/amd64,linux/arm/v6,linux/arm/v7,linux/arm64 --push .
	docker buildx build --tag sineverba/php8xc:latest --tag sineverba/php8xc:1.1.0 --platform linux/amd64,linux/armhf,linux/arm64 --push .

test:
	@docker run --rm sineverba/testphp8xc php -v | grep 8.0.6
	@docker run --rm sineverba/testphp8xc php -v | grep OPcache
	@docker run --rm sineverba/testphp8xc php -m | grep xdebug
	@docker run --rm sineverba/testphp8xc php -r "xdebug_info();" | grep "3.0.4"
	@docker run --rm sineverba/testphp8xc php -m | grep pdo_pgsql
	@docker run --rm sineverba/testphp8xc php -m | grep zip
	@docker run --rm sineverba/testphp8xc /usr/bin/composer -V | grep "2.0.13"
	@docker run --rm sineverba/testphp8xc php -i | grep "short_open_tag => Off => Off"
	@docker run --rm sineverba/testphp8xc php -i | grep "memory_limit => 512M => 512M"

destroy:
	docker image rm sineverba/testphp8xc
