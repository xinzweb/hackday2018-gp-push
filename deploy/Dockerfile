FROM build:latest as build

FROM greenplum-for-kubernetes:latest

RUN sudo apt install -y gdb strace

COPY --from=build /opt/gpdb/ /tmp/input_gpdb/gpdb/
COPY --from=build /gpdb/ /home/gpadmin/gpdb/
RUN cp -r /tmp/input_gpdb/gpdb/ /opt/
