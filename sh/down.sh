#!/bin/bash



echo 'гасим бд'
docker-compose down

echo 'удаляем файлы бд'
sudo rm -rf data
