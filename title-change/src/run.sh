#!/bin/bash -e
# ########################################################################
#
# Script to change the default title of the BigBlueButton HTML5 client.
#
# The script prompts the user to enter the desired locale.
# https://docs.bigbluebutton.org/administration/customize/#change-title-in-the-html5-client
# 
#
# Author: StreamWise - https://www.streamwise.app/
#
# ########################################################################

TARGET="/usr/share/meteor/bundle/programs/server/assets/app/config/settings.yml"

# Check if the user is root
if [ "$(id -u)" != "0" ]; then
    # show echo in red color
    echo -e "\e[31mError: This script must be executed as root.\e[0m"
    exit 1
fi

# Check if the environment is a server running BigBlueButton using bbb-conf command
if ! command -v bbb-conf > /dev/null; then
    # show echo in red color
    echo -e "\e[31mError: This script is intended to be executed on a BigBlueButton server.\e[0m"
    exit 1
fi

# If parameter -p is passed, use it as the title, otherwise prompt the user
if [ "$1" == "-p" ]; then
    title="$2"
else
    read -r -p "Enter the desired title (e.g., StreamWise): " title
fi

# Update the BigBlueButton title
yq w -i $TARGET public.app.clientTitle "$title"

# certify that the target file is owned by meteor
chown meteor:meteor $TARGET

#show echo in green color
echo -e "\e[32mThe default locale for BigBlueButton has been set to: ${title}.\e[0m"