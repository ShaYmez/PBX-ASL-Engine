FROM amd64/debian:buster

# ENTRYPOINT ["/entrypoint"]


# Install build dependencies

RUN apt-get update && apt-get -y install \
    build-essential \
    devscripts \
    fakeroot \
    debhelper \
    automake \
    autotools-dev \
    pkg-config \
    git \
    ca-certificates \
    wget \
    --no-install-recommends

# add the kc1kcc repo for build deps
RUN echo "deb https://kc1kcc.com/repos/asl_builds buster main" > /etc/apt/sources.list.d/kc1kcc_asl_builds.list
RUN wget -O - https://kc1kcc.com/repos/apt.gpg.key | apt-key add -

# Install application dependencies
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install \
    debhelper quilt zlib1g-dev libreadline-dev libgsm1-dev libssl-dev libtonezone-dev libasound2-dev libpq-dev unixodbc-dev libpri-dev libvpb-dev asl-dahdi-source autotools-dev libnewt-dev libsqlite-dev libspeex-dev libspeexdsp-dev graphviz libcurl4-openssl-dev doxygen gsfonts libpopt-dev libiksemel-dev freetds-dev libvorbis-dev libsnmp-dev libcap-dev libi2c-dev libjansson-dev libusb-dev\
    --no-install-recommends

RUN apt-get update -y
RUN apt-get install -y asl-asterisk asl-dahdi --option=Dpkg::Options::=--force-confdef

# COPY entrypoint /entrypoint
# Make Executable
# RUN chmod +x /entrypoint
