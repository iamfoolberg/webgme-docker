# webgme-docker

webgme docker

a simple webgme docker for demo

# 0.build the image

read the Dockerfile and change it if neccessary.

`sudo docker build -t webgme:20220821 .`

# 1.create a mongo db

e.g.

```
mkdir -p /docker/data/mongodb

docker run -itd --name mongo \
  -p 27017:27017 \
  -v /docker/data/mongodb:/data/db \
  mongo:4.2.7-bionic
```

# 2.create the webgme container

```
docker run -itd --name=webgme \
  -p 8800:8888 \
  --mount src=webgmevol,dst=/opt/webgme \
  webgme:20220821
```

# 3.config the mongo db uri

in the docker volume **webgmevol**(in /var/lib/docker/volumes/webgmevol/config.docker.js, default), change the uri

```
...
//config your mongo db url
config.mongo.uri = 'mongodb://127.0.0.1:27017/mywebgme';
...
```

# 4.restart the webgme container or start it
`sudo docker restart webgme`

or

`sudo docker exec webgme bash -c "npm start &"`


