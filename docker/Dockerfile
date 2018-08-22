FROM debian:9.5-slim

# TODO: This may be a moving target, figure out how to pin.
RUN apt-get update \
    && apt-get install -y \
        curl \
        gnupg2 \
        lsb-release \
        build-essential \
        procps \
        systemd \
    # Install google-fluentd at version 1.5.35-1.
    && curl -sS https://dl.google.com/cloudagents/install-logging-agent.sh | REPO_SUFFIX=20180810-1 DO_NOT_INSTALL_CATCH_ALL_CONFIG=true bash \
    && rm -rf /var/lib/apt/lists/* /tmp/* \
    && apt-get autoremove \
    && find /var/log -name "*.log" -type f -delete \
    && apt-get remove -y \
    curl \
    lsb-release

ENV LD_PRELOAD=/opt/google-fluentd/embedded/lib/libjemalloc.so
ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/sbin/google-fluentd"]
