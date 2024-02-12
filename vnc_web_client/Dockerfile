FROM python:3.12.2-bookworm

# Set default values for build arguments
ARG MARIO_PARTY_USER=mario
ARG UID=1000
ARG GID=1000

RUN groupadd -g ${GID} mario_party_user
RUN useradd -g ${GID} -u ${UID} ${MARIO_PARTY_USER}

RUN apt update && apt-get install -y
RUN apt install git -y

COPY start_vnc_client.sh /scripts/start_vnc_client.sh
RUN chmod +x /scripts/start_vnc_client.sh

# Install noVNC
RUN wget https://github.com/novnc/noVNC/archive/refs/tags/v1.4.0.tar.gz -O /tmp/noVNC-1.4.0.tar.gz
RUN tar -xvf /tmp/noVNC-1.4.0.tar.gz -C /usr/share/
RUN rm /tmp/noVNC-1.4.0.tar.gz
# Make the vnc.html the default page
RUN ln -s /usr/share/noVNC-1.4.0/vnc.html /usr/share/noVNC-1.4.0/index.html

# Install websockify
RUN pip3 install websockify==0.11.0
# Install Numpy for HyBi protocol
RUN pip3 install numpy==1.26.4

# Copy webaudio.js to the noVNC folder
COPY webaudio.js /usr/share/noVNC-1.4.0/core/webaudio.js
# Add the webaudio.js to the noVNC html
RUN sed -i "39i import WebAudio from \"../core/webaudio.js\";" /usr/share/noVNC-1.4.0/core/rfb.js
RUN sed -i "229i this._wa = new WebAudio('ws://localhost:4713/websockify');" /usr/share/noVNC-1.4.0/core/rfb.js
RUN sed -i "604i this._wa.start();" /usr/share/noVNC-1.4.0/core/rfb.js

WORKDIR /home/${MARIO_PARTY_USER}
RUN chown -R ${MARIO_PARTY_USER} /home/${MARIO_PARTY_USER}

USER ${MARIO_PARTY_USER}
