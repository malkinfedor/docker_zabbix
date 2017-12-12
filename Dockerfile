FROM local/c7-systemd
RUN mkdir /tmp/packages/ \
&& mkdir /tmp/packages/dependency/
COPY zabbix-web-pgsql-3.4.4-2.el7.noarch.rpm zabbix-server-pgsql-3.4.4-2.el7.x86_64.rpm   /tmp/packages/
#COPY ./dependency /tmp/packages/dependency/
#RUN yum localinstall  /tmp/packages/dependency/* -y \
#&& rm -rf /tmp/packages/dependency/ \
RUN yum install http://repo.zabbix.com/zabbix/3.4/rhel/7/x86_64/zabbix-release-3.4-2.el7.noarch.rpm -y 
#RUN yum localinstall /tmp/packages/* -y 
RUN yum localinstall /tmp/packages/zabbix-server-pgsql-3.4.4-2.el7.x86_64.rpm -y 
RUN yum localinstall /tmp/packages/zabbix-web-pgsql-3.4.4-2.el7.noarch.rpm -y
RUN systemctl enable zabbix-server.service
RUN systemctl enable httpd.service

COPY zabbix_server.conf /etc/zabbix/zabbix_server.conf
COPY zabbix.conf /etc/httpd/conf.d/zabbix.conf
COPY zabbix.conf.php /etc/zabbix/web/zabbix.conf.php
EXPOSE 80
CMD ["/usr/sbin/init"]
