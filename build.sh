#!/bin/bash
./configure --prefix=/usr                            \
            --exec-prefix=                           \
            --libdir=/usr/lib                        \
            --docdir=/usr/share/doc/procps-ng-3.3.12 \
            --disable-static                         \
            --disable-kill                           \
            --with-systemd
make -j $SHED_NUM_JOBS
make DESTDIR=${SHED_FAKE_ROOT} install
mkdir -v ${SHED_FAKE_ROOT}/lib
mv -v ${SHED_FAKE_ROOT}/usr/lib/libprocps.so.* ${SHED_FAKE_ROOT}/lib
ln -sfv ../../lib/$(readlink ${SHED_FAKE_ROOT}/usr/lib/libprocps.so) ${SHED_FAKE_ROOT}/usr/lib/libprocps.so
