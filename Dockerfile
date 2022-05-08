FROM amd64/debian:buster

ENTRYPOINT ["/entrypoint"]


# Install build dependencies

RUN apt-get update && apt-get -y install \
    gnupg \
    net-tools \
    
    --no-install-recommends

RUN wget -O - http://dvswitch.org/DVSwitch_Repository/dvswitch.gpg.key 2>/dev/null | apt-key add - > /dev/null 2>&1

# add the dv-switch repo for build deps
RUN echo "# Official DVSwitch repository" >/etc/apt/sources.list.d/dvswitch.list
RUN echo "deb http://dvswitch.org/DVSwitch_Repository $distribution hamradio" >>/etc/apt/sources.list.d/dvswitch.list
RUN echo "#" >>/etc/apt/sources.list.d/dvswitch.list

# Install application dependencies
# RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install \
#    debhelper quilt zlib1g-dev libreadline-gplv2-dev libgsm1-dev libssl-dev libtonezone-dev libasound2-dev libpq-dev unixodbc-dev libpri-dev libvpb-dev asl-dahdi-source autotools-dev libnewt-dev libsqlite-dev libspeex-dev libspeexdsp-dev graphviz libcurl4-openssl-dev doxygen gsfonts libpopt-dev libiksemel-dev freetds-dev libvorbis-dev libsnmp-dev libcap-dev libi2c-dev libjansson-dev libusb-dev \
#    --no-install-recommends

RUN apt-get update -y
RUN apt-get install -y allstar --option=Dpkg::Options::=--force-confdef

COPY entrypoint /entrypoint
# Make Executable
RUN chmod +x /entrypoint
