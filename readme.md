## Run Chromium in Docker 

#### Chromium v14 with Xvfb

**Build it:**

`docker build -t local/chromium:14 .`

**Run it:**

`docker run -p 5900:5900 --user apps --privileged -ti local/chromium:14`

**Connect to it: (You need VNC Viewer)**

`vncviewer --FullColor --SendClipboard --AcceptClipboard localhost`


Fluxbox is a very light graphical desktop manager, once connected with VNCViewer, right click anywhere and from application menu open a terminal.

run chromium-browser in terminal and you'll get chromium up & running!

