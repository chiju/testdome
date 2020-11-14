##sonarqube default username: admin
##sonarqube default password: admin
version: "2"

services:

  nginx: 
    depends_on:
      - sonarqube
      - db
    image: nginx
    networks:
      - apachenet
    volumes:
      - ./nginx.conf:/etc/nginx/nginx.conf
      - ./conf.d:/etc/nginx/conf.d
    ports:
      - 80:80

  apache1:
    depends_on:
      - db
    image: httpd
    ports:
      - "9000:9000"
    networks:
      - apachenet

   apache2:
    depends_on:
      - db
    image: httpd
    ports:
      - "9000:9000"
    networks:
      - apachenet 

  db:
   image: percona
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: example


networks:
  apachenet:
    driver: bridge