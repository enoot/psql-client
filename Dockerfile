ARG ALPINE_VERSION=3.22
FROM alpine:${ALPINE_VERSION}

# Set PostgreSQL and Alpine version
ARG ALPINE_VERSION=3.22
ARG PG_VERSION=17.5

# Install PostgreSQL client (version 17)
# Alpine 3.21 includes PostgreSQL 17
COPY --from=postgres:${PG_VERSION}-alpine${ALPINE_VERSION} /usr/local/bin/psql /usr/local/bin/psql

RUN apk add --no-cache \
    ca-certificates \
    && rm -rf /var/cache/apk/*

# Create a non-root user
RUN addgroup -g 1000 psql && \
    adduser -D -u 1000 -G psql psql

USER psql

# Set entrypoint to psql
ENTRYPOINT ["psql"]
CMD ["--version"]
