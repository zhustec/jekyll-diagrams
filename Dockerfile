ARG BASE_IMAGE="ubuntu:latest"

FROM $BASE_IMAGE

ARG USER_NAME="diagrams"
ARG USER_UID="1000"
ARG WORK_DIR="/work"

RUN set -eux ; \
        apt-get -qq update ; \
        DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
                build-essential \
                default-jre-headless \
                graphviz \
                npm \
                libatk1.0-0 \
                libatk-bridge2.0-0 \
                libgtk-3-0 \
                libx11-xcb1 \
                libxcomposite1 \
                libxrandr2 \
                libxss1 \
                libpango1.0-dev \
                libpython3-dev \
                python3-cairo \
                python3-gi \
                python3-gi-cairo \
                python3-pip \
                python3-setuptools \
                ruby-full ; \
        apt-get clean ; \
        rm -rf /var/lib/apt/lists/*

RUN set -eux ; \
        gem update --no-document --system ; \
        gem install --no-document bundler ; \
        pip3 install actdiag blockdiag nwdiag seqdiag syntrax ; \
        npm install --global yarn ; \
        yarn global add \
                bit-field \
                mermaid.cli \
                nomnoml \
                netlistsvg \
                state-machine-cat \
                vega-cli \
                vega-lite \
                wavedrom-cli

WORKDIR $WORK_DIR

COPY jekyll-diagrams.gemspec Gemfile Gemfile.lock ./
COPY lib/jekyll_diagrams/version.rb lib/jekyll_diagrams/version.rb

RUN bundle install

RUN set -eux ; \
        useradd -s /bin/bash -m -N -u $USER_UID $USER_NAME ; \
        chown -R $USER_NAME:users $WORK_DIR

USER $USER_NAME
