#!/bin/bash
set -o nounset -o errexit -o pipefail
IFS=$'\n\t'

# Create the dummies-network if it doesn't exist
if ! docker network ls | grep -G "\\bdummies-network\\b"; then
    echo "Creating Docker network 'dummies-network'..."
    docker network create dummies-network
fi

# Grant permission to display GUI applications from Docker containers
if [ "$XDG_SESSION_TYPE" = "x11" ] || [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    xhost +local:root
else
    echo "Warning: currently, this script only supports X11 and Wayland sessions. If you are using a different session type, the GUI applications may not be displayed correctly."
fi

# Assign and export some environment variables for the Docker containers
MY_UID="$(id -u)"
export MY_UID

MY_GID="$(id -g)"
export MY_GID

# Update all submodules to the latest commit
git submodule update --init --recursive

# Build the GUI's Docker image
cd dummies-gui
#git checkout dev
docker build -f Dockerfile -t dummies-gui:latest .

# Build the server's Docker image
cd ../dummies-server
#git checkout dev
docker build -f Dockerfile -t dummies-server:latest .

# Return to the root directory
cd ..

# Launch the Docker containers for the receiver GUI and server
docker compose up receiver-gui receiver-server

# Clean up Docker containers after user stops the execution
docker compose down receiver-gui receiver-server
