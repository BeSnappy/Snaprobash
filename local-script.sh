#!/usr/bin/env bash

# Handle the local shell language packs
echo ">>> Setting up shell locales"
sudo apt-get install -qq language-pack-en

# Handle the PostgreSQL Database Setup
echo ">>> Setting up local database"
sudo -u postgres -H psql -c "CREATE DATABASE snappy;"
sudo -u postgres -H psql -c "GRANT ALL PRIVILEGES ON DATABASE snappy TO root;"

# Configure memcached to listen on all interfaces
sudo sed -i "s/-l 127\.0\.0\.1/-l 0\.0\.0\.0/" /etc/memcached.conf
sudo service memcached restart
