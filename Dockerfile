FROM debian:11

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && apt-get install -y \
    dropbear \
    # needed so VS Code can use scp to install itself
    openssh-client

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