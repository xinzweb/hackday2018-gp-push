FROM build:latest as build

FROM greenplum-for-kubernetes:latest

COPY --from=build /opt/gpdb/ /tmp/input_gpdb/gpdb/
RUN cp -r /tmp/input_gpdb/gpdb/ /opt/
