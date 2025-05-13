# Docker VNC desktop

Docker VNC desktop contains the scripts needed to build images including clean DE's with VNC support. Images are supposed to be as light as possible and simple to run. I use these images mostly for development purposes or quick tasks.

## ROS2 with XFCE Desktop

To run the ROS2 environment with XFCE desktop:

```bash
# Use -d to run in detached mode
docker compose -f docker-compose-ros.yaml up
```

### Connecting via VNC

You can connect to the desktop environment using any VNC client. Here are the instructions for different clients:

#### Using Remmina (Recommended for Linux):
1. Install Remmina if not already installed:
   ```bash
   sudo apt install remmina remmina-plugin-vnc
   ```
2. Open Remmina and create a new connection
3. Important: Select "VNC" as the protocol (or Remmina-VNC-Plugin) (not RDP)
4. Enter connection details:
   - Server: `localhost:5900`
   - Color depth: Full color (24 bit) (adjust based on needs)
   - Quality: Best (adjust based on needs)
   - Username: (leave empty)
   - Password: (leave empty unless configured) (default is ubuntu:ubuntu)

#### Other VNC Clients:
- On Windows: Use TightVNC or RealVNC
- On macOS: Use the built-in Screen Sharing app
Connect to: `localhost:5900`

## LXQT on docker on Raspberry Pi (arm64)

```docker run --rm -e USER=luca -e RESOLUTION=1920x1080 -p 5900:5900 carlonluca/vnc-desktop:jammy-lxqt```

![Docker lxqt on the Raspberry Pi 4](extras/docker-lxqt.webp)

## XFCE (amd64)

```docker run --rm -e USER=luca -e RESOLUTION=1920x1080 -p 5900:5900 carlonluca/vnc-desktop:jammy-xfce```

![Docker xfce on Manjaro](extras/docker-xfce.webp)

## Run

To simply run the image and expose the port to localhost use:

```docker run --rm -p 5900:5900 carlonluca/vnc-desktop:bullseye-xfce```

This will run the DE as the root user. To run it as a regular user set the USER variable:

```docker run --rm -e USER=luca -p 5900:5900 carlonluca/vnc-desktop:bullseye-xfce```

The resolution is set to a default, which is frequently too small. Setting the RESOLUTION env variable is sufficient to change it:

```docker run --rm -e USER=luca -e RESOLUTION=1920x1080 -p 5900:5900 carlonluca/vnc-desktop:bullseye-xfce```

_NOTE: default credentials for all images are ubuntu:ubuntu._