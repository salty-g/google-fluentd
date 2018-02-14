FROM debian:7

RUN apt-get update -y && apt-get install -y \
        procps \
        git \
        make \
        g++ \
        autoconf \
        bzip2 \
        fakeroot \
        curl \
  && gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 \
  && (curl -sSL https://get.rvm.io | /bin/bash -s stable) \
  && git config --global user.email "stackdriver-github-reader@google.com" \
  && git config --global user.name "stackdriverreader" \
  && /bin/bash -l -c "rvm requirements && rvm install 2.4 && gem install bundler --no-ri --no-rdoc && gem update"
