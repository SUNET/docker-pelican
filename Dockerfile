FROM debian:stable
MAINTAINER Leif Johansson <leifj@sunet.se>
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get -q update
RUN apt-get -y upgrade
RUN apt-get -y install python python-dev python-pip git
RUN pip install pelican markdown
RUN git clone https://github.com/getpelican/pelican-plugins.git /opt/pelican-plugins
ADD start.sh /start.sh
RUN chmod a+rx /start.sh
ADD generate /usr/bin/generate
RUN chmod a+rx /usr/bin/generate
RUN mkdir -p /var/www
VOLUME /var/www
WORKDIR /var/www
ENTRYPOINT ["/start.sh"]
