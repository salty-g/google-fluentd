FROM ubuntu:xenial

RUN apt-get update \
    && apt-get install -y \
        curl \
        lsb-release \
    && rm -rf /var/lib/apt/lists/* \
    && curl -sS https://dl.google.com/cloudagents/install-logging-agent.sh | bash \
    && /opt/google-fluentd/embedded/bin/gem uninstall fluent-plugin-google-cloud \
    && /opt/google-fluentd/embedded/bin/gem install fluent-plugin-google-cloud -v 0.6.8.pre.2 \
    && apt-get autoremove \
    && sed -i "s/num_threads 8/num_threads 8\n  detect_json true\n  # Enable metadata agent lookups.\n  enable_metadata_agent true\n  metadata_agent_url \"http:\/\/$METADATA_AGENT_HOSTNAME:8000\"/" "/etc/google-fluentd/google-fluentd.conf"

ENV METADATA_AGENT_HOSTNAME ""

CMD /usr/sbin/google-fluentd
