FROM quay.io/centos/centos:stream
LABEL maintainer="liangzheng@deeproute.ai"

# RUN yum install -y epel-release ccache
# RUN yum install -y gcc gcc-c++ python36  python3-devel wget iproute \
#     vim tmux git bash jq rpm-build \
#     zsh python3-pip \
#     xmlsec1-devel \
#     xmlsec1-openssl-devel \
#     python3-pip \
#     cryptopp cryptopp-devel \
#     c-ares c-ares-devel \
#     gnutls-devel \
#     hwloc-devel \
#     yaml-cpp-devel \
#     dpdk-devel \
#     protobuf-devel \
#     openmpi-devel \
#     mlocate \
#     lksctp-tools lksctp-tools-devel \
#     ragel ragel-devel \
#     numactl-devel numactl

# ADD /shared/docker/ /docker

# oh-my-zsh
# ENV ZSH_DISABLE_COMPFIX true
# RUN /docker/install-omz.sh

ENV CEPH_ROOT /ceph
ENV CYPRESS_CACHE_FOLDER /ceph/build/src/pybind/mgr/dashboard/cypress

VOLUME ["/ceph"]
# VOLUME ["/shared"]

CMD ["bash"]

# yum install -y gcc gcc-c++ python36 python36-devel python3-pip
# yum install -y epel-release
# yum install -y ccache fmt-devel openssl-devel libudev-devel libblkid-devel
# yum install -y lttng-tools 
# yum install -y libuuid-devel popt-devel libxml2-devel
# dnf --enablerepo=powertools install lttng-ust-devel snappy-devel lua-devel libbabeltrace-devel
# yum install -y libibverbs-devel libsqlite3x-devel gperftools-devel leveldb-devel
# yum install -y libaio-devel lz4-devel fuse-devel xfsprogs-devel
# yum install -y liboath-devel expat-devel openldap-devel libcurl-devel
# yum install -y libicu-devel cryptsetup-devel ncurses-devel libnl3-devel
# yum install -y libcap-ng-devel
# pip3 install cython prettytable
# ld.so.conf https://blog.csdn.net/zhq5515/article/details/69358792 ldconfig
