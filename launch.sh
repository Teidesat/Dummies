#!/usr/bin/env bash

if ! docker network ls | grep -G "\\bdummies-network\\b"; then # Asserting dummies-network exists
  docker network create dummies-network
fi

if [ "$XDG_SESSION_TYPE" = "x11" ]; then
  # If using X11, disable access control to allow GUIs to be displayed
  xhost +local:root
# elif [ "$XDG_SESSION_TYPE" = "wayland" ]; then
  # ToDo: Check if similar work has to be done for Wayland
fi

git submodule update --init --recursive # Update submodules

# At the moment, the app is not dockerized in the master branch
cd dummies-gui
git checkout dev
cd ..

docker compose up -d
