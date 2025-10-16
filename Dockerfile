FROM alpine:3.21

# Set PostgreSQL version
ENV PG_MAJOR=17 \
    PG_VERSION=17.5

# Install PostgreSQL client (version 17)
# Alpine 3.21 includes PostgreSQL 17
RUN apk add --no-cache \
    postgresql${PG_MAJOR}-client \
    ca-certificates \
    && rm -rf /var/cache/apk/*

# Create a non-root user
RUN addgroup -g 1000 psql && \
    adduser -D -u 1000 -G psql psql

USER psql

# Set entrypoint to psql
ENTRYPOINT ["psql"]
CMD ["--version"]
