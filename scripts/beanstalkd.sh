#!/usr/bin/env bash

echo ">>> Installing Beanstalkd"

# Install Beanstalkd
# -qq implies -y --force-yes
sudo apt-get install -qq beanstalkd

# Set to start on system start
sudo sed -i "s/#START=yes/START=yes/" /etc/default/beanstalkd
sudo sed -i "s/BEANSTALKD_LISTEN_ADDR=127\.0\.0\.1/BEANSTALKD_LISTEN_ADDR=0\.0\.0\.0/" /etc/default/beanstalkd

# Start Beanstalkd
sudo service beanstalkd start
