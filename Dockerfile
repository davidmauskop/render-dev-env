FROM debian:11

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && apt-get install -y \
    chromium \
    curl \
    dnsutils \
    dropbear \
    fzf \
    git \
    htop \
    httpie \
    iputils-ping \
    jq \
    lsof \
    make \
    man \
    netcat \
    nodejs \
    npm \
    openssh-client \
    postgresql-client \
    procps \
    python3 \
    python3-pip \
    redis-tools \
    rsync \
    sqlite3 \
    tmux \
    unzip \
    vim \
    wget \
    zip

# create a non-root user named dev
RUN useradd --user-group --uid 1000 dev -s /bin/bash

# copy in start script
COPY start.sh /usr/bin/start.sh

# give non-root user ownership dropbear key files, start script
RUN chown -R dev:dev /etc/dropbear /usr/bin/start.sh

# switch to non-root user
USER dev
# Run start script
ENTRYPOINT ["/usr/bin/start.sh"]