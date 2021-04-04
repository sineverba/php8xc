php8xc: Docker image for PHP8 + Xdebug + Composer
=================================================

`docker pull sineverba/php8xc:latest`


| CD / CI   |           |
| --------- | --------- |
| Semaphore CI | [![Build Status](https://sineverba.semaphoreci.com/badges/php8xc/branches/master.svg)](https://sineverba.semaphoreci.com/projects/php8xc) |



Docker image built from **PHP8.y.z** CLI official + **X**debug + **C**omposer, for `linux/386,linux/amd64,linux/arm/v6,linux/arm/v7,linux/arm64` architectures.

Short tags are __OFF__.

Image ready to use as alias for development.

Do you use it? **Star it!**


## Github / image tags and versions

| Github / Docker Image tag | PHP Version | Composer version | XDebug | Architectures |
| ------------------------- | ----------- | ---------------- | ------ | ------------- |
| latest | 8.0.3 | 2.0.12 | 3.0.3 | linux/386,linux/amd64,linux/arm/v6,linux/arm/v7,linux/arm64 |
| 1.1.0 | 8.0.3 | 2.0.12 | 3.0.3 | linux/386,linux/amd64,linux/arm/v6,linux/arm/v7,linux/arm64 |
| 1.0.0 | 8.0.3 | 2.0.11 | 3.0.3 | linux/386,linux/amd64,linux/arm/v6,linux/arm/v7,linux/arm64 |

## Xdebug and settings

During development, you can enable/disable xdebug.mode` with

```yaml
# docker-compose.yml
services:
  app:
    environment:
      XDEBUG_MODE: "off"
```

For values, see [https://xdebug.org/docs/all_settings#mode](https://xdebug.org/docs/all_settings#mode)

## OpCache and settings

During development, you can enable/disable `opcache_validate_timestamps` with

```yaml
# docker-compose.yml
services:
  app:
    environment:
      PHP_OPCACHE_VALIDATE_TIMESTAMPS: 1
```

### Update local image

`$ docker pull sineverba/php8xc:latest`


### PHP modules

`$ docker run --rm sineverba/php8xc php -m`

| PHP modules |
| ----------- |
| bcmath |
| Core |
| ctype |
| curl |
| date |
| dom |
| exif |
| fileinfo |
| filter |
| ftp |
| gd |
| hash |
| iconv |
| json |
| libxml |
| mbstring |
| mysqli |
| mysqlnd |
| openssl |
| pcntl |
| pcre |
| PDO |
| pdo_mysql |
| pdo_pgsql |
| pdo_sqlite |
| Phar |
| posix |
| readline |
| Reflection |
| session |
| SimpleXML |
| sodium |
| SPL |
| sqlite3 |
| standard |
| tokenizer |
| xdebug |
| xml |
| xmlreader |
| xmlreader |
| xmlwriter 
| xmlreader |
| zlib |
| Xdebug |
| zip |

### Add image as alias

``` bash
$ cd ~
$ nano .bashrc
$ alias php74='docker run -it -w /data -v ${PWD}:/data --entrypoint php --rm sineverba/php8xc:latest'
$ alias composer74='docker run -it -w /data -v ${PWD}:/data --entrypoint "/usr/bin/composer" --rm sineverba/php8xc:latest'
```

### Issues with memory limit (on composer)

`$ php -d memory_limit=-1 /usr/bin/composer require [...]`

#### Build and test image locally

```shell
$ make build
$ make test
$ make destroy
```

+ Check images list

`$ docker image ls`

+ Clone the project

`$ git clone git@github.com:sineverba/php8xc.git`

+ Run from same folder

`$ docker build --tag php8xc:x.y.z .`

+ Check new image (php8xc:x.y.z)

`$ docker image ls`