# docker file to build regress.so
FROM build:master

# build the new regress.so
WORKDIR /gpdb

RUN rm -f src/backend/cdb/cdbutil.c
COPY cdbutil.c src/backend/cdb/
RUN make -j4 -s
RUN make install
