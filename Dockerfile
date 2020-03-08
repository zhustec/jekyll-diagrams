FROM ubuntu:bionic

RUN set -eux; \
        apt-get update; \
        apt-get install -y --no-install-recommends build-essential cabal-install \
                cargo default-jre-headless git graphviz libpango1.0-dev \
                libpython3-dev npm python3-pip python3-cairo python3-gi \
                python3-setuptools ruby ruby-dev

RUN set -eux; \
        gem update -N --system; \
        gem install -N bundler; \
        npm install -g --silent mermaid.cli nomnoml state-machine-cat wavedrom-cli; \
        pip3 install blockdiag seqdiag actdiag nwdiag syntrax

WORKDIR /opt/jekyll-diagrams

COPY . .

# RUN set -eux; \
#         apt-get install -y --no-install-recommends cabal-install; \
#         cabal update; \
#         cabal install erd

# RUN bundle install
