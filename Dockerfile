FROM debian:jessie

RUN apt-get update && apt-get -y --no-install-recommends install \
    apt-transport-https \
    bzip2 \
    ca-certificates \
    curl \
    expect \
    git \
    lsb-release \
    openssl \
    sudo \
    unzip \
    vim \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /code
ADD po config-expect.sh /code/
RUN chmod +x po config-expect.sh \
  && ./config-expect.sh \
  && ./po install /particle basic \
  && rm -rf /var/lib/apt/lists/*

VOLUME /code

CMD po
