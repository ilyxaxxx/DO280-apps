FROM centos:7
RUN yum install httpd php -y
RUN sed -i "s/Listen 80/Listen 8080/g" /etc/httpd/conf/httpd.conf
ADD index.php /var/www/html/index.php
EXPOSE 8080

RUN chgrp -R 0 /var/log/httpd /var/run/httpd && \
    chmod -R g=u /var/log/httpd /var/run/httpd

USER 1001

CMD ["/usr/sbin/httpd","-D", "FOREGROUND"]
