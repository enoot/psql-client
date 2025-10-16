# psql-client

Docker images for PostgreSQL client based on Alpine Linux.

## Features

- Lightweight Alpine Linux base (Alpine 3.21)
- PostgreSQL client version 17.5
- Runs as non-root user for security
- Automatically built and pushed to GitHub Container Registry (GHCR)

## Usage

Pull the image from GHCR:

```bash
docker pull ghcr.io/enoot/psql-client:17.5
# or
docker pull ghcr.io/enoot/psql-client:latest
```

Run psql client:

```bash
docker run --rm ghcr.io/enoot/psql-client:17.5 --version
```

Connect to a PostgreSQL database:

```bash
docker run --rm -it ghcr.io/enoot/psql-client:17.5 -h hostname -U username -d database
```

## Building Locally

```bash
docker build -t psql-client:local .
```

## Available Tags

- `17.5` - PostgreSQL client version 17.5
- `latest` - Latest version (currently 17.5)
- `main` - Latest build from the main branch

## License

See [LICENSE](LICENSE) file.
