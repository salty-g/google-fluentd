FROM debian:9

RUN apt-get -y update \
 # Needed for the gpg2 command below.
 && apt-get -y install linux-libc-dev gnupg2 \
 # Needed for rvm.
 && apt-get -y install procps \
 # Clean up all the downloaded packages.
 && rm -f *.deb \
 # Now install the necessary packages.
 && apt-get -y install \
        autoconf \
        bzip2 \
        curl \
        fakeroot \
        git \
        g++ \
        make \
        ruby \
 # RVM GPG keys.
 && gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB \
 && (curl -sSL https://get.rvm.io | /bin/bash -s stable) \
 # RVM requires running in a login shell.
 && /bin/bash -l -c "rvm requirements && rvm install 2.5.3 && gem install bundler --no-document && gem update" \
 && apt-get -y clean
