FROM alpine:latest

WORKDIR /app

ENV OUTPUT /stylesheet/
ENV MAP_PBF_URL https://download.geofabrik.de/asia/azerbaijan-latest.osm.pbf
ENV DB_PORT=5432
ENV DB=*
ENV DB_HOST=localhost
ENV DB_USER=postgres

RUN apk update --no-cache && \
	apk add --no-cache python3 py3-yaml && \
	apk add --no-cache py-pip && \
	apk add postgresql-dev gcc python3-dev musl-dev && \
	apk add --no-cache gdal gdal-tools && \
 	apk add --no-cache npm git && \
 	apk add --no-cache postgresql-client && \
	npm install -g carto && \
	git clone https://github.com/gravitystorm/openstreetmap-carto.git carto

RUN pip install psycopg2
RUN pip install requests
#install mapnik?

COPY init.sh /app/init.sh
COPY db-init.sh /app/db-init.sh
COPY db-init-ddl.sql /app/db-init-ddl.sql
COPY post-init.sh /app/post-init.sh

RUN ln -s /app/init.sh /usr/bin/init
RUN ln -s /app/db-init.sh /usr/bin/db-init
RUN ln -s /app/post-init.sh /usr/bin/post-init

#ENTRYPOINT []


CMD ["/app/init.sh"]
