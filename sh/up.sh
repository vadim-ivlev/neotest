#!/bin/bash

# поднимаем бд
docker-compose up -d
sleep 1

echo 'Open http://localhost:7474/'

