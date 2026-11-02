# Pi-hole for Home Assistant OS

## What this app runs

This app runs the official multi-architecture `pihole/pihole:2026.10.1`
container image. It does not fork, rebuild, or modify Pi-hole source code.

The app is experimental and has not yet been validated on a live Home Assistant
OS installation.

## Ports

| Purpose | Container port | Home Assistant host port |
| --- | ---: | ---: |
| DNS TCP | 53 | 53 |
| DNS UDP | 53 | 53 |
| Web interface HTTP | 80 | 8081 |

Open the Pi-hole web interface at:

`http://<HOME_ASSISTANT_IP>:8081/admin/`

The web interface uses host port 8081 to avoid conflicting with Home
Assistant's own web interface.

## Persistent data

The app maps its persistent app configuration directory to `/etc/pihole`.
Pi-hole's database and configuration therefore remain available across app
restarts and image upgrades. App backups use cold mode, so the app is stopped
while its data is backed up.

## First start and password

The official Pi-hole image assigns a random web password if one has not been
set. Check the app log for the generated password. You can also set/reset it
from the app terminal using:

`pihole setpassword`

Do not paste the password into public issues or commit it to this repository.

## Safe testing sequence

1. Before installing, check that TCP and UDP port 53 are available on the
   Home Assistant host. If either port is already occupied, stop here.
2. Install and start the app without changing router DNS or DHCP settings.
3. Confirm the app log shows Pi-hole FTL started without errors.
4. Open the web interface on port 8081 and sign in.
5. Configure upstream DNS in Pi-hole's web interface. Do not use
   `127.0.0.1` for a resolver running on another machine; inside this
   container, loopback refers to the Pi-hole container itself.
6. From one test client only, query the Pi-hole host directly. Confirm both
   normal domain resolution and a known blocked test domain behave as expected.
7. Check the Pi-hole query log and confirm the test client's queries appear.
8. Restart the app and verify its settings and query database persist.

Do not change router DNS, DHCP, or any existing Pi-hole service during this
initial test. Do not uninstall or reconfigure another DNS server as part of
this project.

## Network mode and DHCP

The app uses the standard Home Assistant app container network with published
ports. `FTLCONF_dns_listeningMode=ALL` is set for Pi-hole's Docker bridge
network.

DHCP is intentionally not enabled. UDP port 67 is not published and the app
does not request `NET_ADMIN`.

## Upstream DNS

No upstream resolver is hard-coded by this app. Configure upstream DNS through
the Pi-hole web interface after startup. Select a resolver that is reachable
from the Home Assistant host's network.

## Version updates

The app version is the official Pi-hole Docker image tag. Update the version
only after reviewing the official Pi-hole release notes and confirming that
the new image supports the target architectures.
