#!/bin/bash -e

# ########################################################################
#
# Script to change the default welcome and footer of BigBlueButton HTML5 client.
#
# The script prompts the user to enter the desired welcome and footer message
# https://docs.bigbluebutton.org/administration/customize/#change-the-default-welcome-message
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

  -m --message <message>
    Set the welcome message for the BigBlueButton client. If empty, defaults to <b>%%CONFNAME%%</b>.

  -f --footer <message>
    Set the footer message for the BigBlueButton client.

HERE
}

main() {
  # bbb web etc config file values override main bbb web properties
  BBB_WEB_ETC_CONFIG="/etc/bigbluebutton/bbb-web.properties"
  check_root
  check_bbb
  build_args "$@"
}

build_args() {
  while [[ $# -gt 0 ]]; do
    arg_key="$1"
    arg_val="$2"
    case $arg_key in
      -h|--help) usage; exit 0 ;;
      -m|--message) change_welcome_message "$arg_val"; shift ;;
      -f|--footer) change_footer_message "$arg_val"; shift ;;
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

change_welcome_message() {
  MESSAGE=${1:-"%%CONFNAME%%"}
  if grep -q "^defaultWelcomeMessage=" "$BBB_WEB_ETC_CONFIG"; then
    sed -i "s/^defaultWelcomeMessage=.*/defaultWelcomeMessage=\"${MESSAGE//\"/\\\"}\"/" "$BBB_WEB_ETC_CONFIG"
  else
    echo "defaultWelcomeMessage=\"${MESSAGE//\"/\\\"}\"" >> "$BBB_WEB_ETC_CONFIG"
  fi
  say "Welcome message changed to: $MESSAGE"
}

# change defaultWelcomeMessageFooter
change_footer_message() {
  MESSAGE=$1
  if grep -q "^defaultWelcomeMessageFooter" "$BBB_WEB_ETC_CONFIG"; then
    sed -i "s/^defaultWelcomeMessageFooter=.*/defaultWelcomeMessageFooter=\"${MESSAGE//\"/\\\"}\"/" $BBB_WEB_ETC_CONFIG
  else
    echo "defaultWelcomeMessageFooter=\"${MESSAGE//\"/\\\"}\"" >> "$BBB_WEB_ETC_CONFIG"
  fi
  say "Footer message changed to: $MESSAGE"
}

main "$@" || exit 1