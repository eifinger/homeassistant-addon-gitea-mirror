ARG BUILD_FROM
FROM ghcr.io/raylabshq/gitea-mirror:v3.9.2

# Switch to root to install packages
USER root

# Install bashio for Home Assistant addon integration
RUN apk add --no-cache \
    bash \
    curl \
    jq

# Install bashio
ARG BASHIO_VERSION="v0.16.2"
RUN curl -L -s "https://github.com/hassio-addons/bashio/archive/${BASHIO_VERSION}.tar.gz" \
    | tar -xzf - -C /tmp \
    && mv /tmp/bashio-*/lib /usr/lib/bashio \
    && ln -s /usr/lib/bashio/bashio /usr/bin/bashio \
    && rm -rf /tmp/bashio-*

# Copy run script
COPY run.sh /
RUN chmod a+x /run.sh

# Remove /app/data if it exists and create symlink to /data
# This ensures the upstream entrypoint writes to the HA persistent storage
RUN rm -rf /app/data && ln -s /data /app/data

# /data will be created and owned by Home Assistant at runtime
# Keep running as root since HA addons typically run as root

# Override the entrypoint to use our run script
ENTRYPOINT []
CMD [ "/run.sh" ]
