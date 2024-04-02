echo "NOT FOR USE \n This is a demo script that will error when executed"
exit 1


# (re)build image
docker context use default
docker build -f ./Dockerfile .

# TODO this is placeholder
# as the image needs to be pushed
# explicitly to Azure
# (likely possible via docker context)
docker push

# deploy azure
docker login azure # login to azure via docker

# @NOTE if browser doesn't open, use this to login to azure
# docker login azure --client-id xx --client-secret yy --tenant-id zz

docker context create aci mhq-demo # create 'context' linked to your azure acc ONLY IF IT DOESNT EXIST
docker context use mhq-demo # switch to this context (aka tell docker to use azure environment)
docker login azure # re-login to azure (optional: fixed an issue on my end)

docker run -p 80:8080 -d nginxdemos/nginx-hello # run container (which now runs on azure instead of your local)


# to stop and remove the container
docker ps # get container ID/name/IP (for running containers)
docker stop <CONTAINER_ID>
docker rm <CONTAINER_ID>

# to get logs
docker logs <CONTAINER_NAME>

# @NOTE lmao nvm it's been discontinued
# to fix Azure error docker-compose "not found"
# (which I believe needs to run on your local?)
# (but fuck me for not using Linux right?)

# curl -L https://raw.githubusercontent.com/docker/compose-cli/main/scripts/install/install_linux.sh | sh
# @NOTE or you can run
# sudo apt-get install docker-compose-plugin

# HOWEVER you can fix it for ECS
# https://github.com/docker/compose-ecs