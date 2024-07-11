#!/bin/bash

# Increase Upload Limit for BigBlueButton Server

# Prompt the user to enter the desired page limit
read -p "Enter the new page limit for uploads: " page_limit

# Validate the user input
if ! [[ "$page_limit" =~ ^[0-9]+$ ]]; then
  echo "Invalid input. Please enter a positive integer."
  exit 1
fi

# Update the BigBlueButton server configuration file
config_file="/etc/bigbluebutton/nginx/web.nginx"
sed -i "s/upload_max_filesize = .*/upload_max_filesize = ${page_limit}M/" "$config_file"
sed -i "s/post_max_size = .*/post_max_size = ${page_limit}M/" "$config_file"

# Restart the BigBlueButton server to apply the changes
systemctl restart nginx

echo "Page limit for uploads has been set to ${page_limit}MB."