#!/bin/bash

# Install dependencies
sudo apt install -y curl lsb-release gnupg

# Add Gazebo key
sudo curl https://packages.osrfoundation.org/gazebo.gpg --output /usr/share/keyrings/pkgs-osrf-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/pkgs-osrf-archive-keyring.gpg] http://packages.osrfoundation.org/gazebo/ubuntu-stable $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/gazebo-stable.list > /dev/null

# Install Gazebo Harmonic
sudo apt update
sudo apt install -y gz-harmonic

# Install ros_gz to interface with ROS2 Humble
sudo apt-get install -y ros-humble-ros-gzharmonic

# gz sim should be now available to run with `gz sim`