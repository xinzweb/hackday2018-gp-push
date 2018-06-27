# docker file to build regress.so
FROM pivotaldata/ubuntu-gpdb-dev:16.04_gcc_6_3

WORKDIR /
RUN git clone https://github.com/greenplum-db/gpdb.git

WORKDIR /gpdb
RUN git checkout 5X_STABLE
RUN ./configure --disable-orca --disable-gpfdist

RUN make -j4 -s
