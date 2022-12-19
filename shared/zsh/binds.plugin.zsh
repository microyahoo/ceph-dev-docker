#compdef binds
#autoload

ceph () {
  DIR=$(pwd)
  cd /ceph/build
  bin/ceph $@
  cd $DIR
}
