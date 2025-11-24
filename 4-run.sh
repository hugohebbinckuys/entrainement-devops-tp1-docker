#!/bin/bash 

docker build -t "express_image" -f ./broken-app/4-dev-app.dockerfile ./broken-app
docker run --rm --name "express_container" -d -p 3000:3000 express_image

#commande pour stopper le container : docker container stop express_container 