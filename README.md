# HAOS Pi-hole

An experimental Home Assistant OS app packaging the official `pihole/pihole` container image. This repository does not fork or modify Pi-hole source code.

**Status:** Experimental. Not yet validated on a live Home Assistant OS host.

Initial testing must not change router DNS settings or disturb any existing DNS servers. DHCP remains disabled. Verify TCP and UDP port 53 availability on the Home Assistant host before installing.

The web interface will use a separate host port to avoid conflicting with Home Assistant's own web interface.
