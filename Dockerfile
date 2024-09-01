FROM mysql:8.0.39

COPY wait-for-it.sh /usr/local/bin/wait-for-it.sh
RUN chmod +x /usr/local/bin/wait-for-it.sh

ENV MYSQL_ROOT_PASSWORD=root

CMD ["wait-for-it.sh", "localhost:3306", "--", "echo", "MySQL is up"]
