# docker file to build greenplum
FROM pivotaldata/ubuntu-gpdb-dev:16.04_gcc_6_3

WORKDIR /
ARG repo
RUN git clone $repo

WORKDIR /gpdb

ARG branch
RUN git fetch origin && git checkout $branch

RUN bash -c "cd /gpdb;\
CFLAGS='-O0 -g' ./configure --disable-orca --disable-gpfdist --with-python --prefix=/opt/gpdb --enable-debug"

RUN make -j4 -s

RUN mkdir -p /opt/gpdb
