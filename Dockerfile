FROM ununtu:focal
LABEL MAINTAINER Greg White <grewhit25@gmail.com>
ENV DEBIAN_FRONTEND noninteractive

RUN \
    apt-get update -qq && \
    apt-get install -qqy --no-install-recommends mpd tini && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* \
	chown -r mpd:audio /var/lib/mpd

COPY mpd.conf /etc/mpd.conf

VOLUME [ "/output" ]
EXPOSE 6600

ENTRYPOINT [ "tini", "--" ]
CMD [ "mpd", "--stdout", "--no-daemon" ]