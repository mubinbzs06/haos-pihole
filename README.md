# HAOS Pi-hole

An independent Home Assistant OS app definition for running the official
[`pihole/pihole` Docker image](https://hub.docker.com/r/pihole/pihole).

This repository contains Home Assistant packaging and documentation only. It
does not fork, copy, or modify Pi-hole's source code.

## Status

**Experimental — packaging is committed, but it has not yet been installed or
validated on a live Home Assistant OS host.**

The app currently targets 64-bit `aarch64` and `amd64` systems and pins the
official Pi-hole image to `2026.10.1`.

## Current app settings

- DNS: host TCP and UDP port 53.
- Web interface: host port 8081, container port 80.
- Persistent Pi-hole data: app configuration mapping at `/etc/pihole`.
- DNS listening mode: `ALL` for the Home Assistant app's bridge network.
- DHCP: disabled; UDP port 67 is not published.
- Backups: cold, so the app is stopped during backup.

## Important safety notes

- Do not change router DNS or DHCP settings during initial testing.
- Do not remove or modify any existing Pi-hole/DNS server until this app has
  been installed, tested, and confirmed stable.
- Verify that TCP and UDP port 53 are available on the Home Assistant host
  before starting the app. If either port is occupied, stop and investigate;
  do not stop another DNS service as part of the initial test.
- Configure an upstream DNS resolver in the Pi-hole web interface after
  startup. Do not use another machine's loopback address as an upstream.

## Add this repository to Home Assistant

In Home Assistant, open **Settings → Apps → App Store → Repositories** and add:

`https://github.com/mubinbzs06/haos-pihole`

Then locate the **Pi-hole** app in the store. Do not install it on a production
network until port 53 availability has been checked.

## Documentation

See [Pi-hole app setup and testing](pihole/DOCS.md).

## License and trademarks

The original packaging and documentation files in this repository are provided
under the MIT License. Pi-hole and its official Docker image are separate
third-party software distributed under their own licenses. Pi-hole is a
trademark of its respective owner. This independent project is not endorsed by
or affiliated with Pi-hole.
