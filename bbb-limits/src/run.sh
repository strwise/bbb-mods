#!/bin/bash -e

# ########################################################################
#
# Script to change the default title of the BigBlueButton HTML5 client.
#
# The script prompts the user to enter the desired locale.
# https://docs.bigbluebutton.org/administration/customize/#change-title-in-the-html5-client
#
# Repository: https://github.com/strwise/bbb-mods
# Author: StreamWise - https://www.streamwise.app/
#
# ########################################################################


# Check if the user is root
check_root() {
  if [ $EUID != 0 ]; then err "You must run this command as root."; fi
}

# Check if the environment is a server running BigBlueButton using bbb-conf command
check_bbb() {
  if ! command -v bbb-conf > /dev/null; then
    err "This script is intended to be executed on a BigBlueButton server."
  fi
}

usage() {
  set +x
  cat 1>&2 <<HERE

Script to change some limits in BigBlueButton.

OPTIONS:

  -h, --help
    Show this help message.

  -p, --page-limit <limit>
    Set the page limit for uploads.

  -s, --max-file-size <size>
    Set the maximum file size for uploads (MB).

  -a, --annotation-limit <limit>
    Set the annotation limit for BigBlueButton.

HERE
}

main() {

  # touch bbb-html5.yml as this override meteor settings (no need touch main file)
  HTML5_ETC_CONFIG="/etc/bigbluebutton/bbb-html5.yml"
  # bbb web etc config file values override main bbb web properties
  BBB_WEB_ETC_CONFIG="/etc/bigbluebutton/bbb-web.properties"

  check_root

  build_args "$@"

}

build_args() {
  while [[ $# -gt 0 ]]; do
    arg_key="$1"
    arg_val="$2"
    case $arg_key in
      -h|--help) usage; exit 0 ;;
      --page-limit|-p) page_limit $arg_val; shift ;;
      --max-file-size|-s) set_max_file_size $arg_val; shift ;;
      --annotation-limit|-a) ANNOTATION_LIMIT=$arg_val; shift ;;
      *) usage_err "Unknown argument: $arg_key" ;;
    esac
    shift
  done
}

say() {
  echo "bbb-mods: $1"
}

err() {
  say "$1" >&2
  exit 1
}

usage_err() {
  say "$1" >&2
  usage
  exit 1
}

#
# Change the file size for an uploaded presentation
# https://docs.bigbluebutton.org/administration/customize/#increase-the-file-size-for-an-uploaded-presentation
#
set_max_file_size() {

  check_bbb

  MAX_FILE_SIZE=$1

  if [ -z "$MAX_FILE_SIZE" ]; then
    usage_err "You must provide a maximum file size."
  fi

  if ! [[ "$MAX_FILE_SIZE" =~ ^[0-9]+$ ]]; then
    usage_err "Invalid input. Please enter a positive integer."
  fi

  # convert $MAX_FILE_SIZE to bytes
  MAX_FILE_SIZE_BYTES=$((MAX_FILE_SIZE * 1024 * 1024))

  # add or update maxFileSizeUpload in BBB properties
  sed -i "s/^maxFileSizeUpload=.*/maxFileSizeUpload=$MAX_FILE_SIZE_BYTES/" $BBB_WEB_ETC_CONFIG

  # update uploadSizeMax in BBB settings
  yq w -i $HTML5_ETC_CONFIG public.presentation.mirroredFromBBBCore.uploadSizeMax "$MAX_FILE_SIZE_BYTES"

  # update nginx client_max_body_size
  # check if BBB is equal or greater than 2.5
  if dpkg --compare-versions "$(dpkg-query --showformat='${Version}' --show bigbluebutton)" ge 2.5; then
      sed -i "s/client_max_body_size [0-9]*m;/client_max_body_size $MAX_FILE_SIZE;/g" /usr/share/bigbluebutton/nginx/web.nginx
    else
      sed -i "s/client_max_body_size [0-9]*m;/client_max_body_size $MAX_FILE_SIZE;/g" /etc/bigbluebutton/nginx/web.nginx
  fi

  say "Maximum file size for uploads has been set to $MAX_FILE_SIZE MB."
  say "Please restart the BigBlueButton server to apply the changes."
  say "Please restart the Nginx server to apply the changes."

}

page_limit() {

  check_bbb

  PAGE_LIMIT=$1

  if [ -z "$PAGE_LIMIT" ]; then
    usage_err "You must provide a page limit."
  fi

  if ! [[ "$PAGE_LIMIT" =~ ^[0-9]+$ ]]; then
    usage_err "Invalid input. Please enter a positive integer."
  fi

  # add or update maxNumPages in bbb-web.properties
  sed -i "s/^maxNumPages=.*/maxNumPages=$PAGE_LIMIT/" $BBB_WEB_ETC_CONFIG

  say "Page limit for uploads has been set to $PAGE_LIMIT."
  say "Please restart the BigBlueButton server to apply the changes."

}

main "$@" || exit 1