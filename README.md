# joomla:3.8-php5.6-apache-intsup

Custom docker image that includes Perl modules required for running specific CGI scripts

## Logging remote IP

Since this repo uses Debian as base image, add the following stanza to your Apache 2.4 configuration file, https://www.loadbalancer.org/blog/apache-and-x-forwarded-for-headers/

```
SetEnvIf X-Forwarded-For "^.*\..*\..*\..*" forwarded
LogFormat "%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\"" combined
LogFormat "%{X-Forwarded-For}i %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\"" forwarded
ErrorLog ${APACHE_LOG_DIR}/error.log
CustomLog ${APACHE_LOG_DIR}/access.log combined env=!forwarded
CustomLog ${APACHE_LOG_DIR}/access.log forwarded env=forwarded
```
