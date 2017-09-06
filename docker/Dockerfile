FROM ubuntu:xenial

RUN apt-get update \
    && apt-get install -y \
        curl \
        lsb-release \
    && rm -rf /var/lib/apt/lists/* \
    && curl -sS https://dl.google.com/cloudagents/install-logging-agent.sh | bash \
    && /opt/google-fluentd/embedded/bin/gem uninstall fluent-plugin-google-cloud \
    && /opt/google-fluentd/embedded/bin/gem install fluent-plugin-google-cloud -v 0.6.8.pre.1 \
    && apt-get autoremove

COPY google-fluentd.conf /etc/google-fluentd/google-fluentd.conf

ENV METADATA_AGENT_HOSTNAME ""

CMD sed -i "s/metadata-agent/$METADATA_AGENT_HOSTNAME/" "/etc/google-fluentd/google-fluentd.conf" \
    && /usr/sbin/google-fluentd
