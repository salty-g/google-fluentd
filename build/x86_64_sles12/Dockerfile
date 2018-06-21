FROM opensuse:latest

RUN zypper install -y \
	autoconf \
	bzip2 \
	curl \
	gcc-c++ \
	git \
	patch \
	procps \
	rpm-build \
	which \
	zlib-devel \
  && gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 \
  && (curl -sSL https://get.rvm.io | /bin/bash -s stable) \
  && /bin/bash -l -c "rvm requirements && rvm install 2.4 && gem install bundler --no-ri --no-rdoc && gem update" \
  && zypper clean
