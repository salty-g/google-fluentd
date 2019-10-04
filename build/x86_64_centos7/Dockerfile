FROM centos:7

RUN yum -y update \
 && yum -y install \
        autoconf \
        bzip2 \
        curl \
        expect \
        gcc-c++ \
        git \
        patch \
        rpm-build \
        rpm-sign \
        which \
        zlib-devel \
 && gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 \
 && (curl -sSL https://get.rvm.io | /bin/bash -s stable) \
 && /bin/bash -l -c "rvm requirements && rvm install 2.5.3 && gem install bundler --no-ri --no-rdoc && gem update"
