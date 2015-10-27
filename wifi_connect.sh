#!/usr/bin/env bash

host=$1
password=$2

# turn wifi on
nmcli radio wifi on

# listing SSID's
nmcli device wifi list

# connect to specific SSID
nmcli device wifi connect ${host} password $password

# check the connection
nmcli device wifi status
