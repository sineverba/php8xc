php8xc: Docker image for PHP8 + Xdebug + Composer
=================================================

> Docker image built from **PHP8.y.z** CLI official + **X**debug + **C**omposer, for `linux/amd64,linux/arm/v6,linux/arm/v7,linux/arm64` architectures.

`docker pull sineverba/php8xc:1.17.1`


| CD / CI   |           |
| --------- | --------- |
| Semaphore CI | [![Build Status](https://sineverba.semaphoreci.com/badges/php8xc/branches/master.svg)](https://sineverba.semaphoreci.com/projects/php8xc) |
| Circle CI | [![CircleCI](https://dl.circleci.com/status-badge/img/gh/sineverba/php8xc/tree/master.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/sineverba/php8xc/tree/master) |
| Docker Hub | `docker pull sineverba/php8xc:1.17.1` - [Link to image](https://hub.docker.com/r/sineverba/php8xc) |



Docker image built from **PHP8.y.z** CLI official + **X**debug + **C**omposer, for `linux/386,linux/amd64,linux/arm/v6,linux/arm/v7,linux/arm64` architectures.

Short tags are __OFF__.

Image ready to use as alias for development.

Do you use it? **Star it!**


## Github / image tags and versions

| Github / Docker Image tag | PHP Version | Composer version | XDebug | Architectures |
|---------------------------|-------------|------------------|--------| ------------- |
| latest                    | 8.3.6       | 2.7.2            | 3.3.2  | linux/arm64,linux/amd64,linux/arm/v6,linux/arm/v7 |
| 1.17.1                    | 8.3.4       | 2.7.2            | 3.3.1  | linux/arm64,linux/amd64,linux/arm/v6,linux/arm/v7 |
| 1.17.0                    | 8.3.4       | 2.7.2            | 3.3.1  | linux/arm64,linux/amd64,linux/arm/v6,linux/arm/v7 |
| 1.16.0                    | 8.3.0       | 2.6.6            | 3.3.1  | linux/arm64/v8,linux/amd64,linux/arm/v6,linux/arm/v7 |
| 1.15.0                    | 8.2.8       | 2.5.8            | 3.2.2  | linux/arm64/v8,linux/amd64,linux/arm/v6,linux/arm/v7 |
| 1.14.0                    | 8.2.3       | 2.5.4            | 3.2.0  | linux/arm64/v8,linux/amd64,linux/arm/v6,linux/arm/v7 |
| 1.13.0                    | 8.2.2       | 2.5.1            | 3.2.0  | linux/arm64/v8,linux/amd64,linux/arm/v6,linux/arm/v7 |
| 1.12.0                    | 8.2.1       | 2.5.1            | 3.2.0  | linux/arm64/v8,linux/amd64,linux/arm/v6,linux/arm/v7 |
| 1.11.0                    | 8.1.11      | 2.4.3            | 3.1.5  | linux/arm64/v8,linux/amd64,linux/arm/v6,linux/arm/v7 |
| 1.10.0                    | 8.1.4       | 2.3.3            | 3.1.4  | linux/arm64/v8,linux/amd64,linux/arm/v6,linux/arm/v7 |
| 1.9.0                     | 8.1.3       | 2.2.6            | 3.1.3  | linux/arm64/v8,linux/amd64,linux/arm/v6,linux/arm/v7 |
| 1.8.0                     | 8.1.0       | 2.1.14           | 3.1.2  | linux/arm64/v8,linux/amd64,linux/arm/v6,linux/arm/v7 |
| 1.7.0                     | 8.0.12      | 2.1.9            | 3.1.1  | linux/arm64/v8,linux/amd64,linux/arm/v6,linux/arm/v7 |
| 1.6.0                     | 8.0.11      | 2.1.8            | 3.0.4  | linux/arm64/v8,linux/amd64,linux/arm/v6,linux/arm/v7 |
| 1.5.0                     | 8.0.9       | 2.1.5            | 3.0.4  | linux/arm64/v8,linux/amd64,linux/arm/v6,linux/arm/v7 |
| 1.4.0                     | 8.0.7       | 2.0.14           | 3.0.4  | linux/arm64/v8,linux/amd64,linux/arm/v6,linux/arm/v7 |
| 1.3.0                     | 8.0.6       | 2.0.13           | 3.0.4  | linux/arm64/v8,linux/amd64,linux/arm/v6,linux/arm/v7 |
| 1.2.0                     | 8.0.3       | 2.0.13           | 3.0.4  | linux/arm64/v8,linux/amd64,linux/arm/v6,linux/arm/v7 |
| 1.1.5                     | 8.0.3       | 2.0.12           | 3.0.3  | linux/arm64/v8,linux/amd64,linux/arm/v6,linux/arm/v7 |
| 1.1.4                     | 8.0.3       | 2.0.12           | 3.0.3  | linux/386,linux/amd64,linux/arm/v6,linux/arm/v7,linux/arm64,linux/arm64/v8 |
| 1.1.3                     | 8.0.3       | 2.0.12           | 3.0.3  | linux/amd64,linux/armhf,linux/arm64 |
| 1.1.2                     | 8.0.3       | 2.0.12           | 3.0.3  | linux/amd64,linux/armhf,linux/arm64 |
| 1.1.1                     | 8.0.3       | 2.0.12           | 3.0.3  | linux/amd64,linux/armhf,linux/arm64 |
| 1.1.0                     | 8.0.3       | 2.0.12           | 3.0.3  | linux/386,linux/amd64,linux/arm/v6,linux/arm/v7,linux/arm64 |
| 1.0.0                     | 8.0.3       | 2.0.11           | 3.0.3  | linux/386,linux/amd64,linux/arm/v6,linux/arm/v7,linux/arm64 |

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
$ alias php='docker run -it -w /data -v ${PWD}:/data --entrypoint php --rm sineverba/php8xc:1.13.0'
$ alias composer='docker run -it -w /data -v ${PWD}:/data --entrypoint "/usr/bin/composer" --rm sineverba/php8xc:1.13.0'
```

### Issues with memory limit (on composer)

`$ php -d memory_limit=-1 /usr/bin/composer require [...]`