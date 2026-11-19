# Changelog

## 2026.11.0

- Update the official Pi-hole base image to `pihole/pihole:2026.11.0`.
- Keep the existing Home Assistant OS packaging, port mappings, persistence, and disabled DHCP behavior.

## 2026.10.1

- Initial experimental Home Assistant OS app definition.
- Runs the official `pihole/pihole:2026.10.1` image.
- Persists `/etc/pihole` through the Home Assistant app configuration mapping.
- Publishes DNS on TCP/UDP 53 and the web UI on host port 8081.
- Configures Pi-hole DNS listening mode for Docker bridge networking.
- Leaves DHCP disabled.
