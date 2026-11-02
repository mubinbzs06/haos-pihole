# Renovate bumps this together with "version" in config.yaml.
# renovate: datasource=docker depName=pihole/pihole
ARG PIHOLE_VERSION=2026.10.1
FROM pihole/pihole:${PIHOLE_VERSION}

# jq is used to read the Home Assistant options file.
RUN apk add --no-cache jq

COPY ha-entrypoint.sh /usr/local/bin/ha-entrypoint.sh
RUN chmod +x /usr/local/bin/ha-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/ha-entrypoint.sh"]
