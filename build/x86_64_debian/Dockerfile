# Image name stackdriver-logging-deb-build-image
# To push to GCR
# 1. $ docker tag stackdriver-logging-deb-build-image:<version> us.gcr.io/<project id>/stackdriver-logging-deb-build-image:<version>
# 2. $ gcloud docker push us.gcr.io/<project id>/stackdriver-logging-deb-build-image:<version>

FROM debian:7

RUN rm /bin/sh && ln -s /bin/bash /bin/sh
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
  && curl -sSL https://get.rvm.io | /bin/bash -s stable \
  && git config --global user.email "stackdriver-github-reader@google.com" \
  && git config --global user.name "stackdriverreader"

RUN /bin/bash -l -c "rvm requirements"
RUN /bin/bash -l -c "rvm install 2.2"
RUN /bin/bash -l -c "gem install bundler --no-ri --no-rdoc"
RUN /bin/bash -l -c "gem update"
