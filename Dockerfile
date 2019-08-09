FROM httpd:2
COPY cosign_files /srv
RUN apt-get update
RUN apt-get install -y gawk gcc
RUN apt-get install -y openssl libssl-dev
RUN apt-get install -y make
WORKDIR /srv
RUN ./configure --enable-apache2=/usr/local/apache2/bin/apxs
RUN make everything
RUN make install-all
RUN mkdir -p /var/cosign/daemon
RUN chown daemon /var/cosign/daemon
CMD sh