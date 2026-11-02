#!/usr/bin/env bash
# Translate Home Assistant app options into the environment variables the
# official Pi-hole image expects, then run its original startup script.
set -eu

OPTIONS=/data/options.json

if [ -f "$OPTIONS" ]; then
  pw="$(jq -r '.password // empty' "$OPTIONS")"
  tz="$(jq -r '.timezone // empty' "$OPTIONS")"
  up="$(jq -r '(.upstream_dns // []) | map(select(length > 0)) | join(";")' "$OPTIONS")"

  if [ -n "$pw" ]; then export FTLCONF_webserver_api_password="$pw"; fi
  if [ -n "$tz" ]; then export TZ="$tz"; fi
  if [ -n "$up" ]; then export FTLCONF_dns_upstreams="$up"; fi
fi

# The official image's ENTRYPOINT is start.sh; preserve its startup behavior.
exec start.sh "$@"
