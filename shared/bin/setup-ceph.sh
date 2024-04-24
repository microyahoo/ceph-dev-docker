#!/bin/bash

set -e

if [[ ! -e /usr/bin/python ]]; then
   ln -s /usr/bin/python3.6 /usr/bin/python
fi
cd /ceph
find . -name \*.pyc -delete
./install-deps.sh

ARGS="-DCMAKE_BUILD_TYPE=Debug -DWITH_SEASTAR=OFF -DWITH_MGR_DASHBOARD_FRONTEND=OFF -DENABLE_GIT_VERSION=OFF -DWITH_TESTS=OFF -DWITH_CCACHE=ON -DWITH_LTTNG=OFF -DWITH_RDMA=OFF -DWITH_FUSE=OFF -DWITH_DPDK=OFF $ARGS"
ARGS="-DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DWITH_PYTHON3=3 -DWITH_RADOSGW_AMQP_ENDPOINT=OFF -DWITH_RADOSGW_KAFKA_ENDPOINT=OFF $ARGS"

NPROC=${NPROC:-$(nproc --ignore=2)}

# Other dependencies
# yum -y module install subversion:1.10

yum install -y ccache

# SSO dependencies
yum -y install xmlsec1-devel xmlsec1-openssl-devel python3-pip cryptopp cryptopp-devel c-ares c-ares-devel gnutls-devel hwloc-devel yaml-cpp-devel dpdk-devel protobuf-devel openmpi-devel lksctp-tools lksctp-tools-devel ragel ragel-devel numactl-devel numactl mlocate

if [ "$CLEAN" == "true" ]; then
    echo "CLEAN INSTALL"
    git clean -fdx
fi

if [ -d "build" ]; then
    git submodule update --init --recursive
    cd build
    # cmake -DBOOST_J=2 $ARGS ..
    cmake -DCMAKE_C_FLAGS="-O0 -g3 -gdwarf-4" -DCMAKE_CXX_FLAGS="-O0 -g3 -gdwarf-4" -DBOOST_J=$NPROC $ARGS ..
else
    sh +x ./do_cmake.sh $ARGS
    cd build
fi

if which ninja; then
    ninja -j$NPROC
else
    # ccache make -j2
    ccache make -j$NPROC
fi


# yum module remove subversion:1.10
