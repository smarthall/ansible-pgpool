#!/bin/bash

sudo /etc/init.d/pgpool-II-93 stop
sudo /etc/init.d/postgresql-9.3 stop
sudo killall postgres
sudo killall pgpool
sudo rm -rf /var/lib/pgsql/9.3/data

