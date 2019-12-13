#!/bin/sh

touch fic
docker ps -f name=blue -q > fic
nb=$(wc -l fic)


if [ "$nb" \> 1 ]
then
    ENV="green"
    OLD="blue"
else
    ENV="blue"
    OLD="green"
fi
rm fic


echo  "Démarrer" $ENV "conteneur" 

docker-compose --project-name=$ENV up -d --build

echo  "En attente ..."

sleep 6s

echo  "Arrêt" $OLD "conteneur" 
docker-compose --project-name=$OLD  stop 


