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

COPY ./matlab /matlab_install

COPY ./crack /crack

COPY ./installer_input.txt /installer_input.txt

RUN chmod +x /matlab_install/install && \
/bin/sh /matlab_install/install -inputFile /installer_input.txt && \
cp /crack/libmwlmgrimpl.so /opt/MATLAB/bin/glnxa64/matlab_startup_plugins/lmgrimpl/ && \
mkdir /opt/MATLAB/licenses/ && \
cp /crack/license.lic /opt/MATLAB/licenses/ && \
rm -rf \
    /matlab_install \
    /crack \
    /installer_input.txt
    



# ======================================




# ADD REMAINING CONFIGURATIONS
FROM base as configure

COPY --from=build / /

COPY ./root /

