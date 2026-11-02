#Renovate bumps this together with "version" in config.yaml.
# renovate: datasource=docker depName=pihole/pihole
ARG PIHOLE_VERSION=2026.10.1
FROM pihole/pihole:${PIHOLE_VERSION}

# The Pi-hole image is Alpine-based and already ships bash and jq.
COPY ha-entrypoint.sh /usr/local/bin/ha-entrypoint.sh
RUN chmod +x /usr/local/bin/ha-entrypoint.sh

HEALTHCHECK --interval=30s --timeout=5s --start-period=60s --retries=3 CMD pihole status || exit 1

ENTRYPOINT ["/usr/local/bin/ha-entrypoint.sh"]
