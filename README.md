# Docker container for Supermicro® IPMIView

Forked from [sunfoxcz/ipmiview](https://github.com/sunfoxcz/ipmiview)

This container runs:

* Xvfb - X11 in a virtual framebuffer
* x11vnc - A VNC server that scrapes the above X11 server
* noNVC - A HTML5 canvas vnc viewer
* Fluxbox - a small window manager

## Usage

Docker compose
```bash
services:
    ipmiview:
        container_name: xtekipmiview
        image: xtekllc/xtekipmiview:latest
        ports:
          - 8181:8080
          - 5959:5900
        volumes:
          - ./config:/config
```

Docker run
```bash
docker run --name xtekipmiview -p 8181:8080 -p 5959:5900 -v ./config:/config xtekllc/xtekipmiview:latest
```

Then open your browser with address `http://localhost:8181/vnc.html`.

Or

Open with VNC `localhost` port `5959`

NOTE: When connected via browser you must disconnect before using VNC
