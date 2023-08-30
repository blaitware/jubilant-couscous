- How install php with breww
```
brew install php@7.4

```
- How to find php.ini location
```
php -r "phpinfo();" | grep php.ini

```
- Switch between PHP version
```
brew unlink php@7.4 && brew link --force —-overwrite php@5.6

```
- Open a terminal in a docker container
```
docker exec -it <container_name_or_id> /bin/bash

```
- Using environment variables to connect to MySQL
```
mysql -h 127.0.0.1 -P 3306 -u $MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE
```
- Find MySQL Container IP Address
```
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' MySQL
```


brew install php@7.0
brew install php@7.1
brew install php@7.2
brew install php@7.3
brew install php@7.4
