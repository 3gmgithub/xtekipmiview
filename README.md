# Docker container for Supermicro® IPMIView

Forked from [sunfoxcz/ipmiview](https://github.com/sunfoxcz/ipmiview)

This container runs:

* Xvfb - X11 in a virtual framebuffer
* x11vnc - A VNC server that scrapes the above X11 server
* noNVC - A HTML5 canvas vnc viewer
* Fluxbox - a small window manager

## Usage

```bash
git clone https://github.com/3gmgithub/xtekipmiview
cd ipmiview
make
docker run -p 8181:8080 3gmgithub/xtekipmiview:latest
```

Then open your browser with address `http://localhost:8181/vnc.html`.

Or

Open with VNC `localhost` port `5959`
