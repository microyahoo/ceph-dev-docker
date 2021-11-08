#!/bin/bash

set -e

setup-proxy.sh

cd /ceph/src/pybind/mgr/dashboard/frontend
source /ceph/build/src/pybind/mgr/dashboard/frontend/node-env/bin/activate
npm ci --unsafe-perm

npm start -- --disableHostCheck=true
