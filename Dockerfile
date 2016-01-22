FROM        node:4.2-onbuild

RUN         node index.js plugins \
                --install kosmtik-osm-data-overlay \
                --install kosmtik-mapnik-reference

EXPOSE      6789

WORKDIR     /usr/src/app

ADD         http://cdn.masonmaps.me/dist/fonts/Arial+Unicode.ttf front/fonts/

ENTRYPOINT  ["./docker_run.sh"]
