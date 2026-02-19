#!/usr/bin/bash

echo "Setting up cos for robotics snaps.."

snap install rob-cos-demo-configuration --channel=basic/beta
echo "Installed configuration snap"

echo "Please enter the device-uid:"
read uid
snap set rob-cos-demo-configuration device-uid=$uid

echo "Please enter the rob-cos-base-url (i.e: http://192.168.0.1/cos-robotics-model):"
read url
snap set rob-cos-demo-configuration rob-cos-base-url=$url

snap install rob-cos-data-sharing --channel=latest/beta
echo "Installed rob-cos-data sharing snap"

# Installing this snap will automatically try to register the device
snap install cos-registration-agent --channel=latest/beta
echo "Installed cos-registration agent snap"

snap install ros2-exporter-agent --channel=latest/beta
echo "Installed ros2-exporter-agent snap"

snap install foxglove-bridge --channel=cos-humble/candidate
echo "Installed foxglove-bridge snap"

snap install rob-cos-grafana-agent --channel=core24/edge
# Connecting all the interfaces to read logs which are not autoconnect
snap connect rob-cos-grafana-agent:hardware-observe
snap connect rob-cos-grafana-agent:log-observe
snap connect rob-cos-grafana-agent:mount-observe
snap connect rob-cos-grafana-agent:network-observe
snap connect rob-cos-grafana-agent:proc-sys-kernel-random
snap connect rob-cos-grafana-agent:system-observe
snap connect rob-cos-grafana-agent:time-control
snap restart rob-cos-grafana-agent
echo "Installed grafana-agent snap"

echo "Device setup with cos for robotics"
