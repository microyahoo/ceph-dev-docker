FROM quay.io/centos/centos:stream
LABEL maintainer="liangzheng@deeproute.ai"

RUN yum install -y gcc gcc-c++ python36 python36-devel python3-pip
RUN yum install -y epel-release
RUN yum install -y ccache fmt-devel openssl-devel libudev-devel libblkid-devel
RUN yum install -y lttng-tools make cmake
RUN yum install -y libuuid-devel popt-devel libxml2-devel
RUN dnf --enablerepo=powertools install -y lttng-ust-devel snappy-devel lua-devel libbabeltrace-devel
RUN yum install -y libibverbs-devel libsqlite3x-devel gperftools-devel leveldb-devel
RUN yum install -y libaio-devel lz4-devel fuse-devel xfsprogs-devel
RUN yum install -y liboath-devel expat-devel openldap-devel libcurl-devel
RUN yum install -y libicu-devel cryptsetup-devel ncurses-devel libnl3-devel
RUN yum install -y libcap-ng-devel
RUN pip3 install cython prettytable
# ld.so.conf https://blog.csdn.net/zhq5515/article/details/69358792 ldconfig

# ADD /shared/docker/ /docker

ENV CEPH_ROOT /ceph
ENV CYPRESS_CACHE_FOLDER /ceph/build/src/pybind/mgr/dashboard/cypress

VOLUME ["/ceph"]
# VOLUME ["/shared"]

CMD ["bash"]

