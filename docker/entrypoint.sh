#!/bin/bash

# For systems without journald.
mkdir -p /var/log/journal

if [ -z "${METADATA_AGENT_URL:-}" -a -n "${METADATA_AGENT_HOSTNAME:-}" ]; then
  METADATA_AGENT_URL="http://${METADATA_AGENT_HOSTNAME}:8000"
fi
if [ -n "$METADATA_AGENT_URL" ]; then
  sed -i "s,http://local-metadata-agent.stackdriver.com:8000,$METADATA_AGENT_URL," \
    /etc/google-fluentd/google-fluentd.conf
fi

trap 'kill $pid' TERM INT

# first arg is a flag.
if [ "${1:0:1}" = '-' ]; then
  /usr/sbin/google-fluentd "$@" &
else
  exec "$@" &
fi

pid=$!
wait $pid
exit_code="$?"
wait $pid

# Ignore 143, as that is the code when SIGINT kills the process.
if [[ exit_code -eq "143" ]]; then
  exit 0
fi

exit $exit_code