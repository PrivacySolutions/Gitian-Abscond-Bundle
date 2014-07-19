#!/bin/bash

. ./versions

# Installing deps
sudo apt-get install git apache2 apt-cacher-ng python-vm-builder ruby qemu-utils qemu-kvm

# Create workdir
if [ ! -d "`pwd`/tmp-workdir" ]; then
  mkdir tmp-workdir
else
  rm -fr tmp-workdir
  mkdir tmp-workdir
fi

cd tmp-workdir
export ROOT_WDIR=`pwd`

# Gitian download
git clone https://github.com/devrandom/gitian-builder.git

cd gitian-builder
export PATH=$PATH:$PWD/libexec
# Make VMs
export PATH=`pwd`/bin:$PATH
./bin/make-base-vm
./bin/make-base-vm --arch i386
cd ..




