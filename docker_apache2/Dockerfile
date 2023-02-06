FROM httpd

RUN apt-get update -y && apt-get install -y vim gcc make libaprutil1-dev perl gawk

COPY ./httpd.conf /usr/local/apache2/conf/
COPY ./workers.properties /usr/local/apache2/conf/

COPY ./tomcat-connectors-1.2.48-src.tar.gz /opt/
RUN cd /opt && tar -xzf tomcat-connectors-1.2.48-src.tar.gz
RUN cd /opt/tomcat-connectors-1.2.48-src/native && ./configure --with-apxs=/usr/local/apache2/bin/apxs && make && make install
