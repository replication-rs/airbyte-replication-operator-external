FROM --platform=$TARGETPLATFORM  rust:slim as build
ARG TARGETPLATFORM
ARG BUILDPLATFORM

RUN echo "Building on $BUILDPLATFORM for $TARGETPLATFORM"

WORKDIR /usr/src/airbyte-replication-operator

COPY scripts scripts
COPY target target

RUN ./scripts/install.sh $TARGETPLATFORM

FROM --platform=$TARGETPLATFORM gcr.io/distroless/cc-debian11

COPY --from=build /usr/local/cargo/bin/airbyte-replication-driver /usr/local/bin/airbyte-replication-driver
COPY --from=build /usr/local/cargo/bin/airbyte-replication-operator /usr/local/bin/airbyte-replication-operator
USER 65532:65532

CMD ["airbyte-replication-operator"]
