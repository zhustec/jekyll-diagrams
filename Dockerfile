FROM ubuntu:bionic

RUN set -eux; \
        apt-get update; \
        apt-get install -y --no-install-recommends \
                build-essential \
                git \
                cabal-install \
                cargo \
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
                ruby \
                ruby-dev

RUN set -eux; \
        cargo install --root /usr/local svgbob_cli; \
        gem update -N --system; \
        gem install -N bundler; \
        npm install -g --silent \
                mermaid.cli \
                nomnoml \
                state-machine-cat \
                vega-cli \
                vega-lite \
                wavedrom-cli; \
        pip3 install \
                blockdiag \
                seqdiag \
                actdiag \
                nwdiag \
                syntrax

WORKDIR /app

RUN gem install -N jekyll jekyll-diagrams

EXPOSE 4000