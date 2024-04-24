FROM quay.io/centos/centos:stream
LABEL maintainer="liangzheng@deeproute.ai"

RUN dnf -y group install "Development Tools"
RUN yum install -y epel-release 
RUN yum install -y gcc gcc-c++ python36 make \
    python3-devel wget iproute \
    vim tmux git bash jq rpm-build \
    zsh python3-pip \
    cryptopp cryptopp-devel \
    c-ares c-ares-devel \
    gnutls-devel \
    yaml-cpp-devel \
    dpdk-devel \
    openmpi-devel \
    lksctp-tools-devel \
    ragel-devel \
    libffi-devel \
    numactl-devel numactl
RUN yum install -y ccache
RUN dnf --enablerepo=powertools install -y protobuf-devel hwloc-devel xmlsec1-devel xmlsec1-openssl-devel

ADD /shared/docker/ /docker

# oh-my-zsh
ENV ZSH_DISABLE_COMPFIX true
RUN /docker/install-omz.sh

ENV CEPH_ROOT /ceph
ENV CYPRESS_CACHE_FOLDER /ceph/build/src/pybind/mgr/dashboard/cypress

VOLUME ["/ceph"]
VOLUME ["/shared"]

CMD ["zsh"]
