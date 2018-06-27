# docker file to build regress.so
FROM build:5X_STABLE 

# build the new regress.so
WORKDIR /gpdb
COPY regress_gp.c src/test/regress/
RUN make -C src/test/regress 
RUN make -C src/test/regress install-lib 
