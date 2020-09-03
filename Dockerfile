# UPDATE BASE IMAGE AND INSTALL PACKAGES
FROM lsiobase/guacgui as base

LABEL maintainer="Chase Kidder <me@chasekidder.com>"
ENV APPNAME="matlab"

RUN \
    apt-get update && \
    apt-get install -y \
        libgtk2.0-dev \
        dbus \
        fcitx-rime \
        fonts-wqy-microhei \
        jq \
        libxkbcommon-x11-0 \
        python \
        python-xdg \
        ttf-wqy-zenhei \
        wget \
        tint2 \
        xz-utils && \
    apt-get clean && \
    rm -rf \
        /tmp/* \
        /var/lib/apt/lists/* \
        /var/tmp/*




# ======================================




# INSTALL STANDALONE APPLICATION
FROM lsiobase/guacgui as build

COPY ./matlab_install_files /matlab_install_files

RUN chmod +x /matlab_install_files/install && \
/bin/sh /matlab_install_files/install -inputFile /matlab_install_files/installer_input.txt && \
rm -rf /matlab_install_files
    



# ======================================




# ADD REMAINING CONFIGURATIONS
FROM base as configure

COPY --from=build / /

COPY ./root /


