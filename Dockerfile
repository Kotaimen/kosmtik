FROM        node:4.2.3-onbuild

RUN         node index.js plugins \
                --install kosmtik-osm-data-overlay \
                --install kosmtik-mapnik-reference

EXPOSE      6789

WORKDIR     /usr/src/app

ENTRYPOINT  ["./docker_run.sh"]
