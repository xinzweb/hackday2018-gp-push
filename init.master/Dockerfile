# docker file to build regress.so
FROM pivotaldata/ubuntu-gpdb-dev:16.04_gcc_6_3

WORKDIR /
RUN git clone https://github.com/greenplum-db/gpdb.git

WORKDIR /gpdb
RUN git checkout

RUN bash -c "cd /gpdb;\
CFLAGS='-O0 -g' ./configure --disable-orca --disable-gpfdist --with-python --prefix=/opt/gpdb --enable-debug"

RUN make -j4 -s

RUN mkdir -p /opt/gpdb
