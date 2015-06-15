FROM centos:centos7
MAINTAINER Deven Phillips <deven.phillips@sungardas.com>

WORKDIR /tmp
RUN curl -o opennms.rpm http://yum.opennms.org/repofiles/opennms-repo-testing-rhel7.noarch.rpm
RUN rpm -Uvh opennms.rpm
RUN yum -y -q install postgresql postgresql-server iplike
ADD scripts/install_postgresql.sh /usr/bin/install_postgresql.sh
RUN chmod 755 /usr/bin/install_postgresql.sh
RUN /usr/bin/install_postgresql.sh

ENV PG_DATA /data/pgsql
ENV PG_LOG /data/log/pgsql
ENV PG_PORT 5432
ENV PG_USER postgres
ENV OPENNMS_DB_NAME opennms
ENV OPENNMS_DB_USER opennms
ENV OPENNMS_DB_USER_PASSWORD opennms

ADD scripts/install_epel.sh /usr/bin/install_epel.sh
RUN chmod 755 /usr/bin/install_epel.sh
RUN /usr/bin/install_epel.sh

RUN yum -y -q install supervisor
ADD postgresql.ini /etc/supervisord.d/

ADD scripts/start /usr/bin/start
RUN chmod 755 /usr/bin/start

EXPOSE 5432
CMD /usr/bin/start
