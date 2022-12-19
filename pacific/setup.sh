WORKSPACE="$(dirname "$(pwd)")"
echo $WORKSPACE

NAME="${NAME:-ceph-1}"
CEPH="${CEPH:-$WORKSPACE/ceph}"
CCACHE="${CCACHE:-$WORKSPACE/ceph-ccache}"

# Removes old container with same name
docker stop $NAME
docker rm $NAME

DOCKER_BUILD_OPTS="--pull"

# Build updated version of the image
TAG="ceph-dev-docker2"
docker build $DOCKER_BUILD_OPTS -t $TAG -f pacific/generate_image.Dockerfile .

# Creates a container with all recommended configs
docker run -itd \
  -v $CEPH:/ceph \
  -v $CCACHE:/root/.ccache \
  -v /run/udev:/run/udev:ro \
  --privileged \
  --net=host \
  --name=$NAME \
  --hostname=$NAME \
  --add-host=$NAME:127.0.0.1 \
  $TAG

docker exec -it $NAME bash
# 1. First, go to `/ceph/build` directory, then run `make install/strip`.
# 2. Then, exit the container, and run `docker commit <container-id> <image>:<tag>`.
# 3. Finally, run `docker push <image>:<tag>`.
