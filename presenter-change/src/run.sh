#!/bin/bash -e

# ########################################################################
#
# Script to change the default PDF presentation used by BigBlueButton.
#
# The script prompts the user to enter the path to a new PDF document.
#
# https://docs.bigbluebutton.org/administration/customize/#change-the-default-presentation
#
# Credits: This script is based on the instructions provided in the official BigBlueButton documentation.
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


# Prompt the user to enter the path to the new PDF document
read -p "Enter the path to the new PDF document: " pdf_path

# check if the user has provided a local or remote path to the PDF document
if [[ "$pdf_path" =~ ^https?:// ]]; then
    echo "Downloading PDF from remote location..."
    # Define a temporary path to store the downloaded PDF
    temp_pdf="/tmp/downloaded_presentation.pdf"
    # Use wget or curl to download the PDF document
    wget -O "$temp_pdf" "$pdf_path" || curl -o "$temp_pdf" "$pdf_path"
    # Check if the download was successful
    if [ $? -ne 0 ]; then
        echo "Error: Failed to download the PDF document."
        exit 1
    fi
    # Set the PDF path to the downloaded file
    pdf_path="$temp_pdf"
else
    echo "Using local PDF document..."
fi

# Check if the document is a PDF
if ! file -b --mime-type "$pdf_path" | grep -q "application/pdf"; then
    echo "Error: The specified document is not a PDF."
    exit 1
fi

# Replace the document's name with the default name used by BigBlueButton
presentation_path="/var/www/bigbluebutton-default/assets"
pdf_name="default.pdf"

cp "$pdf_path" "$presentation_path/$pdf_name"

echo "The default BigBlueButton PDF presentation has been successfully changed to $pdf_path."