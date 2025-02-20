#!/usr/bin/env bash
if ! docker network ls | grep -G "\\bdummies-network\\b"; then # Asserting dummies-network exists
  docker network create dummies-network
fi

git submodule update --init --recursive # Update submodules
cd dummies-gui
git checkout dev # At the moment, the app is not dockerized in the master branch
docker compose up -d
cd ../dummies-server
docker compose up
