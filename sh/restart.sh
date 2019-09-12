#!/bin/bash

echo 'гасим бд'
docker-compose down

echo 'удаляем файлы бд'
sudo rm -rf data

# поднимаем бд
docker-compose up -d
sleep 1

echo 'Open http://localhost:7474/'


