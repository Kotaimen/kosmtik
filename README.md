# Kosmtik

Pack everything into a single docker container to deal with terrible `node-mapnik` dependency issues.

See [original readme](https://github.com/kosmtik/kosmtik) for documentation.

## Test
To test supplied default world map, run:

    docker run -p 0.0.0.0:8080:6789 kotaimen/kosmtik

And opening a browser at:
    
    http://127.0.0.1:8080/

## Usage

Suppose you have a map project structure:
        
    /map_gallery/project.yaml (mapnik project)
    /map_gallery/background.mss (mapnik stylesheet)
    /map_gallery/road.mss
    ...
    /map_gallery/etc/pgbouncer/pgbouncer.ini (pgbouncer config)
    /map_gallery/etc/pgbouncer/userlist.txt (pgbouncer config)
    /map_gallery/res/... 
    ... 
    (local resources and data)
    ...

Write a `docker-compose.yml` mount local project directory into container.  Pgbouncer is used as indirection so mapnik stylesheets does't need to change between design/stage/prod environments:

    # map editor
    kosmtik:
      image: kotaimen/kosmtik
      command: /map_gallery/project.yaml
      links:
        - pgbouncer
        - pgbouncer:localhost
      volumes:
        - ./map_gallery/:/map_gallery/:ro
      ports:
        - "8080:6789"
    
    # pgbouncer
    pgbouncer:
      image: kotaimen/pgbouncer
      volumes:
        - ./etc/pgbouncer:/etc/pgbouncer:ro
        - ./log/postgresql:/var/log/postgresql

Start the service:
    
    docker-compose up
    
When you edit project file and stylesheets, change will be reflected in the container immediately and kosmitk will refresh the map.


