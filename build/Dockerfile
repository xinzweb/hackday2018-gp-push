FROM build:master

# upload new src
COPY src/ /tmp/input_src/src/
RUN cp -rf /tmp/input_src/src/ /gpdb

# build
WORKDIR /gpdb
RUN make -j4 -s
RUN make install 
