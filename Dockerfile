FROM debian:11

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && apt-get install -y \
    dropbear \
    # needed so VS Code can use scp to install itself
    openssh-client

# create a non-root user named dev
RUN useradd --create-home --user-group --uid 1000 dev -s /bin/bash

# copy in public key
RUN mkdir -p /home/dev/.ssh
RUN --mount=type=secret,id=key_pub,dst=/etc/secrets/key.pub cat /etc/secrets/key.pub >> /home/dev/.ssh/authorized_keys

# give non-root user ownership of home directory, dropbear key files
RUN chown -R dev:dev /home/dev /etc/dropbear

# switch to non-root user
USER dev
# start ssh server
# -F runs dropbear in the foreground
# -E sends logs to stderr
# -k disables remote port forwarding
# -s disables password logins
# -w disables root logins
ENTRYPOINT ["dropbear", "-F", "-E", "-k", "-s", "-w"]
