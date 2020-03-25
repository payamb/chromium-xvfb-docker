## Run Chromium in Docker 

### Chromium 14 with Xvfb

**Build it:**

`docker build -f dockerfile.v14 -t local/chromium:14 .`

**Run it:**

`docker run -p 5900:5900 --user apps --privileged -ti local/chromium:14`

### Chromium 6 with Xvfb

**Build it:**

`docker build -f dockerfile.v6 -t local/chromium:6 .`

**Run it:**

`docker run -p 5900:5900 --user apps --privileged -ti local/chromium:6`

## Connect to it: (You need VNC Viewer)

`vncviewer --FullColor --SendClipboard --AcceptClipboard localhost`


Fluxbox is a light weight window manager, once connected with VNCViewer, right click anywhere on the screen and from application menu open a terminal.

then run chromium-browser in the terminal and you'll have chromium up & running!

