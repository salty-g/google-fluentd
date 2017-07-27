FROM ubuntu:xenial

RUN apt-get update
RUN apt-get install -y curl
RUN apt-get install -y lsb-release
RUN rm -rf /var/lib/apt/lists/*
RUN curl -sS https://dl.google.com/cloudagents/install-logging-agent.sh | bash

RUN /opt/google-fluentd/embedded/bin/gem uninstall fluent-plugin-google-cloud && /opt/google-fluentd/embedded/bin/gem install fluent-plugin-google-cloud -v 0.6.4.pre.3

COPY google-fluentd.conf /etc/google-fluentd/google-fluentd.conf
CMD sed -i "s/metadata-agent/$METADATA_AGENT_HOSTNAME/" "/etc/google-fluentd/google-fluentd.conf" && /usr/sbin/google-fluentd
