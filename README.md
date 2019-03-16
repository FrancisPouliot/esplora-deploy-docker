# esplora

## Init docker swarm and overlay network, once
```
docker swarm init
docker network create --driver=overlay --attachable --opt encrypted esploranet
```

## Do the following line only if data_bitcoin_mainnet doesn't already exist / isn't already mounted
```
cd ; mkdir data_bitcoin_mainnet ; sudo mount /dev/vdc data_bitcoin_mainnet/
```

## Build the image -- if updating, remove all cached images
```
./build.sh
```

## Start TLS manager (Let's Encrypt Companion) + Esplora
```
docker stack deploy -c docker-compose.yml esplora
```

## Start Esplora outside of the docker-compose file
```
docker run -d --expose 80 --network=esploranet --name esplora -v /home/debian/data_bitcoin_mainnet:/data --rm --env-file esplora.env esplora bash -c "/srv/explorer/run.sh bitcoin-mainnet explorer"
```
