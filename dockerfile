FROM debian:stable-slim

RUN apt-get update && apt-get install -y \
    # build-essential \
    gdebi-core apt-utils libgconf-2-4 multiarch-support build-essential x11vnc fluxbox xvfb wget wmctrl lzma bash \
    libasound2 libatk1.0-0 libcairo2 libgtk2.0-0 libpango1.0-0

RUN apt-get clean
RUN dpkg --configure -a

# Add a user for running applications.
RUN useradd apps
RUN mkdir -p /home/apps && chown apps:apps /home/apps

# Install chromium dependencies
RUN wget http://ftp.uk.debian.org/debian/pool/main/x/xdg-utils/xdg-utils_1.1.1-1+deb9u1_all.deb
RUN wget https://snapshot.debian.org/archive/debian/20101112T145114Z/pool/main/libv/libvpx/libvpx0_0.9.1-2_amd64.deb
RUN wget https://launchpad.net/ubuntu/+archive/primary/+files/libgcrypt11_1.5.3-2ubuntu4.2_amd64.deb
RUN wget http://security.ubuntu.com/ubuntu/pool/main/libp/libpng/libpng12-0_1.2.54-1ubuntu1.1_amd64.deb
RUN wget http://old-releases.ubuntu.com/ubuntu/pool/universe/c/chromium-browser/chromium-browser_5.0.342.9~r43360-0ubuntu2_amd64.deb
RUN wget http://ftp.uk.debian.org/debian/pool/main/n/nspr/libnspr4-0d_4.12-1+debu8u1_amd64.deb
RUN wget http://security.debian.org/debian-security/pool/updates/main/n/nss/libnss3-1d_3.26-1+debu8u10_amd64.deb
RUN wget http://ftp.uk.debian.org/debian/pool/main/n/nspr/libnspr4_4.12-1+debu8u1_amd64.deb
RUN wget http://security.debian.org/debian-security/pool/updates/main/n/nss/libnss3_3.26-1+debu8u10_amd64.deb
RUN wget http://ftp.uk.debian.org/debian/pool/main/g/gconf/libgconf2-4_3.2.6-3_amd64.deb
RUN wget http://ftp.uk.debian.org/debian/pool/main/g/gconf/libgconf-2-4_3.2.6-3_amd64.deb
RUN wget http://ftp.uk.debian.org/debian/pool/main/g/gconf/gconf2-common_3.2.6-3_all.deb

RUN dpkg -i libgcrypt11_1.5.3-2ubuntu4.2_amd64.deb
RUN dpkg -i libvpx0_0.9.1-2_amd64.deb
RUN dpkg -i libpng12-0_1.2.54-1ubuntu1.1_amd64.deb
RUN dpkg -i libnspr4_4.12-1+debu8u1_amd64.deb
RUN dpkg -i libnss3_3.26-1+debu8u10_amd64.deb
RUN dpkg -i libnspr4-0d_4.12-1+debu8u1_amd64.deb
RUN dpkg -i libnss3-1d_3.26-1+debu8u10_amd64.deb

RUN dpkg -i gconf2-common_3.2.6-3_all.deb
RUN dpkg -i libgconf-2-4_3.2.6-3_amd64.deb
RUN dpkg -i libgconf2-4_3.2.6-3_amd64.deb
RUN dpkg -i xdg-utils_1.1.1-1+deb9u1_all.deb

# Install chromium 
RUN wget http://old-releases.ubuntu.com/ubuntu/pool/universe/c/chromium-browser/chromium-browser_14.0.835.202~r103287-0ubuntu1_amd64.deb
RUN wget http://old-releases.ubuntu.com/ubuntu/pool/universe/c/chromium-browser/chromium-codecs-ffmpeg_14.0.835.202~r103287-0ubuntu1_amd64.deb
RUN wget http://old-releases.ubuntu.com/ubuntu/pool/universe/c/chromium-browser/chromium-codecs-ffmpeg-extra_14.0.835.202~r103287-0ubuntu1_amd64.deb

RUN dpkg -i \
    chromium-browser_14.0.835.202~r103287-0ubuntu1_amd64.deb \
    chromium-codecs-ffmpeg_14.0.835.202~r103287-0ubuntu1_amd64.deb

COPY bootstrap.sh /

CMD '/bootstrap.sh'