#!/usr/bin/bash

echo "Setting up rob-cos snaps.."

snap install rob-cos-demo-configuration --beta
echo "Installed configuration snap"

echo "Please enter the device-uid:"
read uid
snap set rob-cos-demo-configuration device-uid=$uid

echo "Please enter the rob-cos-base-url (i.e: http://192.168.0.1/rob-cos-model):"
read url
snap set rob-cos-demo-configuration rob-cos-base-url=$url

snap install rob-cos-data-sharing  --beta
echo "Installed rob-cos-data sharing snap"

# Installing this snap will automatically try to register the device
snap install cos-registration-agent --beta
echo "Installed cos-registration agent snap"

snap install ros2-exporter-agent --beta
echo "Installed ros2-exporter-agent snap"

snap install foxglove-bridge --beta
echo "Installed foxglove-bridge snap"

# Home made Snap Store
pip3 install gdown
gdown https://drive.google.com/uc\?id\=1VOw1JGLLv38mz3DP8UpUtAJ53QWLsxe5
snap install rob-cos-grafana-agent_*_amd64.snap --devmode
snap connect rob-cos-grafana-agent:configuration-read rob-cos-demo-configuration:configuration-read
echo "Installed grafana-agent snap"

echo "rob-cos device setup"