# Image name stackdriver-logging-rhel7-build-image
# To push to GCR
# 1. $ docker tag stackdriver-logging-rhel7-build-image:<version> us.gcr.io/<project id>/stackdriver-logging-rhel7-build-image:<version>
# 2. $ gcloud docker push us.gcr.io/<project id>/stackdriver-logging-rhel7-build-image:<version>

FROM centos:7

RUN yum update -y && yum -y install \
  git \
  curl \
  which \
  procps \
  gcc-c++ \
  zlib-devel \
  patch \
  bzip2 \
  rpm-build \
  rpm-sign \
  autoconf \
  expect

ENV PATH ${PATH}:/usr/local/bin

RUN curl -o fakeroot-libs.rpm "http://mirror.centos.org/centos/6/os/x86_64/Packages/fakeroot-libs-1.12.2-22.2.el6.x86_64.rpm" \
  && curl -o fakeroot.rpm "http://mirror.centos.org/centos/6/os/x86_64/Packages/fakeroot-1.12.2-22.2.el6.x86_64.rpm" \
  && rpm -i fakeroot.rpm fakeroot-libs.rpm \
  && gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 \
  && git config --global user.email "stackdriver-github-reader@google.com" \
  && git config --global user.name "stackdriverreader"

RUN curl -sSL https://get.rvm.io | /bin/bash -s stable
RUN /bin/bash -l -c "rvm requirements"
RUN /bin/bash -l -c "rvm install 2.2"
RUN /bin/bash -l -c "gem install bundler --no-ri --no-rdoc"
RUN /bin/bash -l -c "gem update"

