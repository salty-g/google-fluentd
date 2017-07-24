FROM centos:6

RUN yum update -y && yum install -y \
  git \
  curl \
  which \
  procps \
  gcc-c++ \
  zlib-devel \
  redhat-lsb-core \
  glibc-devel \
  patch \
  bzip2 \
  rpm-build \
  rpm-sign \
  autoconf \
  expect \
  centos-release-SCL

ENV PATH ${PATH}:/usr/local/bin

RUN rpm -ivh http://repoforge.mirror.constant.com/redhat/el6/en/x86_64/rpmforge/RPMS/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm \
  && yum --enablerepo=rpmforge-extras install -y git \
  && gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 \
  && git config --global user.email "stackdriver-github-reader@google.com" \
  && git config --global user.name "stackdriverreader"

RUN curl -sSL https://get.rvm.io | /bin/bash -s stable
RUN /bin/bash -l -c "rvm requirements && rvm install 2.2 && gem install bundler --no-ri --no-rdoc && gem update"
