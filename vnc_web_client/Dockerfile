FROM python:3.12.2-bookworm

# Set default values for build arguments
ARG MARIO_PARTY_USER=mario
ARG UID=1000
ARG GID=1000

RUN groupadd -g ${GID} mario_party_user
RUN useradd -g ${GID} -u ${UID} ${MARIO_PARTY_USER}

RUN apt update && apt-get install -y
RUN apt install git -y

# Install Numpy for HyBi protocol
RUN pip3 install numpy==1.26.4

COPY start_vnc_client.sh /scripts/start_vnc_client.sh
RUN chmod +x /scripts/start_vnc_client.sh

WORKDIR /home/${MARIO_PARTY_USER}
RUN git clone https://github.com/novnc/noVNC
RUN chown -R ${MARIO_PARTY_USER} /home/${MARIO_PARTY_USER}

USER ${MARIO_PARTY_USER}
