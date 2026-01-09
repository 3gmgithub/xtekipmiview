FROM ubuntu:18.04

LABEL org.opencontainers.image.authors="X-Tek dockerfile@xtekmail.com"

ENV DEBIAN_FRONTEND=noninteractive
ENV DISPLAY=:0.0

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY files /opt/IPMIView

RUN mkdir /config && \
touch /config/IPMIView.properties && \
touch /config/account.properties && \
touch /config/email.properties && \
touch /config/smcrakp.properties && \
touch /config/timeout.properties

RUN ln -s /config/IPMIView.properties /opt/IPMIView/IPMIView.properties && \
ln -s /config/account.properties /opt/IPMIView/account.properties && \
ln -s /config/email.properties /opt/IPMIView/email.properties && \
ln -s /config/smcrakp.properties /opt/IPMIView/smcrakp.properties && \
ln -s /config/timeout.properties /opt/IPMIView/timeout.properties

RUN apt-get update
RUN apt-get dist-upgrade -y --no-install-recommends
RUN apt-get install -y --no-install-recommends \
	software-properties-common \
	xvfb \
	x11vnc \
	supervisor \
	fluxbox \
	firefox \
	git
RUN git clone https://github.com/novnc/noVNC.git /opt/noVNC
RUN git clone https://github.com/novnc/websockify /opt/noVNC/utils/websockify

RUN apt-get remove --purge -y git && \
	apt-get autoremove -y && \
	apt-get clean && \
	rm -rf /build && \
	rm -rf /tmp/* /var/tmp/* && \
	rm -rf /var/lib/apt/lists/*

EXPOSE 8080
EXPOSE 5900

CMD ["/usr/bin/supervisord"]
