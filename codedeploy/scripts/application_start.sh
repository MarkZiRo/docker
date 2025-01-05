#!/usr/bin/env bash

running=$(docker ps -a --format "{{.ID}}" --filter "name=todo-cd" | wc -l)
if [ $running -ge 1 ]; then
  docker stop todo-cd
  docker rm todo-cd
fi

docker pull ziromark/docker:latest
docker run -d --name todo-cd -p 8080:8080 ziromark/docker:latest

