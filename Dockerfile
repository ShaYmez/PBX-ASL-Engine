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

# add the official ASL repo for build deps
RUN echo "deb http://apt.allstarlink.org/repos/asl_builds buster main" > /etc/apt/sources.list.d/allstar.list
RUN wget -O - http://downloads.allstarlink.org/repos/repo_signing.key | apt-key add -

# Install application dependencies
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install \
    debhelper quilt zlib1g-dev libreadline-dev libgsm1-dev libssl-dev libtonezone-dev libasound2-dev libpq-dev unixodbc-dev libpri-dev libvpb-dev asl-dahdi-source autotools-dev libnewt-dev libsqlite-dev libspeex-dev libspeexdsp-dev graphviz libcurl4-openssl-dev doxygen gsfonts libpopt-dev libiksemel-dev freetds-dev libvorbis-dev libsnmp-dev libcap-dev libi2c-dev libjansson-dev libusb-dev\
    --no-install-recommends

RUN apt-get update -y

RUN apt-get install -y linux-headers-$(uname -r) asl-asterisk allstar-helpers asl-dahdi --option=Dpkg::Options::=--force-confdef

RUN apt-get update && apt-get install -y openssh-server sudo
RUN mkdir /var/run/sshd
RUN echo 'root:screencast' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

# COPY entrypoint /entrypoint
# Make Executable
# RUN chmod +x /entrypoint
