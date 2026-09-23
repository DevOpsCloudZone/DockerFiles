FROM httpd:2.4-alpine
RUN rm -rf /usr/local/apache2/htdocs/*
COPY index.html /usr/local/apache2/htdocs
RUN chown -R daemon:daemon /usr/local/apache2/htdocs
EXPOSE 80
#USER daemon
CMD ["httpd-foreground"]

