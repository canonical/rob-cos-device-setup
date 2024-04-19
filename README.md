# rob-cos-device-setup

Helper bash script to set up a rob-cos device's snaps.

Download the script on the device with:

`curl -L https://raw.githubusercontent.com/ubuntu-robotics/install-snaps-on-device.sh -O`

And run it with:

`sudo bash setup-robcos-device.sh`

The script will initiate prompts for the robot UID and the rob-cos-server URL. While the robot UID is optional,
the URL is mandatory, serving as the designated address for the rob-cos server where the device registration occurs.
The queries and response will look as follows:

```
Please enter the device-uid:
my-new-robot

Please enter the rob-cos-server-url:
http://<rob-cos-server-ip>/rob-cos-model
```

The script will proceed installing all the necessary snaps and registering the device on the provided rob-cos-server.
