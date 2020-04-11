FROM ubuntu:latest

ARG USER="diagrams"
ARG UID="1000"
ARG GID="1000"

RUN apt-get -qq update && \
        apt-get install -yq --no-install-recommends \
                build-essential \
                git \
                sudo \
                vim \
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
                python3-pip \
                python3-setuptools \
                python3-cairo \
                python3-gi \
                python3-gi-cairo \
                ruby-full && \
        apt-get clean && \
        rm -rf /var/lib/apt/lists/*

RUN useradd -s /bin/bash -m --no-user-group --uid $UID $USER

USER $USER

ENV HOME=/home/$USER
ENV GEM_HOME=$HOME/.gem/ruby/2.5.0 \
    LOCAL_PATH=$HOME/.local \
    NPM_PREFIX=$HOME/.npm
ENV PATH=$GEM_HOME/bin:$LOCAL_PATH/bin:$NPM_PREFIX/bin:$PATH

RUN gem install --no-document --user-install bundler && \
        npm config set prefix $HOME/.npm && \
        npm install --global --silent \
                mermaid.cli \
                nomnoml \
                state-machine-cat \
                vega-cli \
                vega-lite \
                wavedrom-cli && \
        pip3 install --quiet --user \
                actdiag \
                blockdiag \
                nwdiag \
                seqdiag \
                syntrax

WORKDIR $HOME/work

COPY Gemfile Gemfile.lock jekyll-diagrams.gemspec ./
COPY lib/jekyll-diagrams/version.rb ./lib/jekyll-diagrams/version.rb

USER root

RUN chown -R $USER:users $HOME/work

USER $USER

RUN bundle install
