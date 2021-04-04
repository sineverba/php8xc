build:
		docker build --tag sineverba/testphp8xc .

multiple:
		docker buildx build --tag sineverba/testphp8xc --platform linux/386,linux/amd64,linux/arm/v6,linux/arm/v7,linux/arm64 --push .

test:
		@docker run --rm sineverba/testphp8xc php -v | grep 8.0.3
		@docker run --rm sineverba/testphp8xc php -v | grep OPcache
		@docker run --rm sineverba/testphp8xc php -m | grep xdebug
		@docker run --rm sineverba/testphp8xc php -r "xdebug_info();" | grep "3.0.3"
		@docker run --rm sineverba/testphp8xc php -m | grep pdo_pgsql
		@docker run --rm sineverba/testphp8xc php -m | grep zip
		@docker run --rm sineverba/testphp8xc /usr/bin/composer -V | grep "2.0.12"
		@docker run --rm sineverba/testphp8xc php -i | grep "short_open_tag => Off => Off"
		@docker run --rm sineverba/testphp8xc php -i | grep "memory_limit => 512M => 512M"

destroy:
		docker image rm sineverba/testphp8xc
