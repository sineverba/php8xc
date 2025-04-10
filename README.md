php8xc: Docker image for PHP8 + Xdebug + Composer
=================================================

> Docker image built from **PHP8.y.z** CLI official + **X**debug + **C**omposer, for `linux/amd64,linux/arm/v6,linux/arm/v7,linux/arm64` architectures.

`docker pull sineverba/php8xc:1.20.0`


| CD / CI   |                                                                                                                                                                                      |
| --------- |--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Semaphore CI | [![Build Status](https://sineverba.semaphoreci.com/badges/php8xc/branches/master.svg)](https://sineverba.semaphoreci.com/projects/php8xc)                                            |
| Circle CI | [![CircleCI](https://dl.circleci.com/status-badge/img/gh/sineverba/php8xc/tree/master.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/sineverba/php8xc/tree/master) |
| Docker Hub | `docker pull sineverba/php8xc:1.20.0` - [Link to image](https://hub.docker.com/r/sineverba/php8xc)                                                                                   |



Docker image built from **PHP8.y.z** CLI official + **X**debug + **C**omposer, for `linux/386,linux/amd64,linux/arm/v6,linux/arm/v7,linux/arm64` architectures.

Short tags are __OFF__.

Image ready to use as alias for development.

Do you use it? **Star it!**


## Github / image tags and versions

| Github / Docker Image tag | PHP Version | Composer version | XDebug | Architectures |
|---------------------------|-------------|------------------|--------| ------------- |
| 1.20.0 | 8.4.5 | 2.8.8 | 3.4.2 | linux/arm64,linux/amd64,linux/arm/v6,linux/arm/v7 |
| latest | 8.4.5 | 2.8.8 | 3.4.2 | linux/arm64,linux/amd64,linux/arm/v6,linux/arm/v7 |

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
| soap |
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
$ alias php='docker run -it -w /data -v ${PWD}:/data --entrypoint php --rm sineverba/php8xc:1.20.0'
$ alias composer='docker run -it -w /data -v ${PWD}:/data --entrypoint "/usr/bin/composer" --rm sineverba/php8xc:1.20.0'
```

### Issues with memory limit (on composer)

`$ php -d memory_limit=-1 /usr/bin/composer require [...]`