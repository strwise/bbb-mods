#!/bin/bash -e
# ########################################################################
#
# Script to change the default locale used by BigBlueButton.
#
# The script prompts the user to enter the desired locale.
# https://docs.bigbluebutton.org/administration/customize/#change-the-default-locale
# 
#
# Author: StreamWise - https://www.streamwise.app/
#
# ########################################################################

# Check if the user is root
if [ "$(id -u)" != "0" ]; then
    echo "Error: This script must be executed as root."
    exit 1
fi

# Check if the environment is a server running BigBlueButton using bbb-conf command
if ! command -v bbb-conf > /dev/null; then
    echo "Error: This script is intended to be executed on a BigBlueButton server."
    exit 1
fi


# If parameter -p is passed, use it as the locale, otherwise prompt the user
if [ "$1" == "-p" ]; then
    locale="$2"
else
    read -r -p "Enter the desired locale (e.g., en_US, pt_BR): " locale
fi


# Validate if locale is in the format xx or xx_XX
if [[ ! "$locale" =~ ^[a-z]{2}(_[A-Z]{2})?$ ]]; then
    # Show error message in red color
    echo -e "\e[31mInvalid input. Please enter a valid locale (e.g., en_US, pt_BR).\e[0m"
    exit 1
fi

# Update the BigBlueButton server configuration file
# https://github.com/bigbluebutton/bigbluebutton/issues/8336#issuecomment-557235107
config_file="/usr/share/meteor/bundle/programs/server/assets/app/config/settings.yml"
sed -i "s/overrideLocale:.*/overrideLocale: ${locale}/" "$config_file"

#show echo in green color
echo -e "\e[32mThe default locale for BigBlueButton has been set to ${locale}.\e[0m"