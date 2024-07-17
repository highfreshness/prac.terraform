#!/bin/bash

sudo dnf install -y httpd
sudo systemctl enable --now httpd
echo "<h1> Hello World </h1>" > /var/www/html/index.html