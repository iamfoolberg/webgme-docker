#!/bin/bash
echo "starting the npm server..."

#do something here

npm start &

echo "started the npm server..."

# make sure the "sleep infinity" in Dockerfile is executed.
exec "$@"