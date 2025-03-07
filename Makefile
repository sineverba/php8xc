IMAGE_NAME=sineverba/php8xc
CONTAINER_NAME=php8xc
APP_VERSION=1.19.0-dev
PHP_VERSION=8.4.4
COMPOSER_VERSION=2.8.6
XDEBUG_VERSION=3.4.1
BUILDX_VERSION=0.13.1
BINFMT_VERSION=qemu-v7.0.0-28

build:
	docker build \
		--build-arg PHP_VERSION=$(PHP_VERSION) \
		--build-arg COMPOSER_VERSION=$(COMPOSER_VERSION) \
		--build-arg XDEBUG_VERSION=$(XDEBUG_VERSION) \
		--tag $(IMAGE_NAME):$(APP_VERSION) \
		"."

preparemulti:
	mkdir -vp ~/.docker/cli-plugins
	curl \
		-L "https://github.com/docker/buildx/releases/download/v$(BUILDX_VERSION)/buildx-v$(BUILDX_VERSION).linux-amd64" \
		> \
		~/.docker/cli-plugins/docker-buildx
	chmod a+x ~/.docker/cli-plugins/docker-buildx
	docker buildx version
	docker run --rm --privileged tonistiigi/binfmt:$(BINFMT_VERSION) --install all
	docker buildx ls
	docker buildx rm multiarch
	docker buildx create --name multiarch --driver docker-container --use
	
multi: preparemulti
	docker buildx inspect --bootstrap --builder multiarch
	docker buildx build \
		--build-arg PHP_VERSION=$(PHP_VERSION) \
		--build-arg COMPOSER_VERSION=$(COMPOSER_VERSION) \
		--build-arg XDEBUG_VERSION=$(XDEBUG_VERSION) \
		--platform linux/arm64,linux/amd64,linux/arm/v6,linux/arm/v7 \
		--tag $(IMAGE_NAME):$(APP_VERSION) \
		"."

test:
	@docker run --rm $(IMAGE_NAME):$(APP_VERSION) php -v | grep $(PHP_VERSION)
	@docker run --rm $(IMAGE_NAME):$(APP_VERSION) php -v | grep OPcache
	@docker run --rm $(IMAGE_NAME):$(APP_VERSION) php -m | grep xdebug
	@docker run --rm $(IMAGE_NAME):$(APP_VERSION) php -r "xdebug_info();" | grep $(XDEBUG_VERSION)
	@docker run --rm $(IMAGE_NAME):$(APP_VERSION) php -m | grep pdo_pgsql
	@docker run --rm $(IMAGE_NAME):$(APP_VERSION) php -m | grep zip
	@docker run --rm $(IMAGE_NAME):$(APP_VERSION) /usr/bin/composer -V | grep $(COMPOSER_VERSION)
	@docker run --rm $(IMAGE_NAME):$(APP_VERSION) php -i | grep "short_open_tag => Off => Off"
	@docker run --rm $(IMAGE_NAME):$(APP_VERSION) php -i | grep "memory_limit => 512M => 512M"
	@docker run --rm $(IMAGE_NAME):$(APP_VERSION) php -m | grep soap

destroy:
	docker image rm php:$(PHP_VERSION)-cli
	docker image rm $(IMAGE_NAME):$(APP_VERSION)