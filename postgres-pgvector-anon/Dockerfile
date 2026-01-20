ARG PG_VECTOR_ANON_IMAGE
ARG PG_ANON_VERSION
FROM ${PG_VECTOR_ANON_IMAGE}

# Install build dependencies
RUN apt-get update \
 && apt-get install -y \
      postgresql-server-dev-all \
      make \
      gcc \
      git \
      pkg-config \
      libssl-dev \
      curl \
      build-essential \
 && rm -rf /var/lib/apt/lists/*

# Install Rust via rustup
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --default-toolchain stable
ENV PATH="/root/.cargo/bin:${PATH}"

# Add rustfmt
RUN rustup component add rustfmt

# Install and initialise PGRX
RUN cargo install cargo-pgrx --version 0.16.1 --locked
RUN cargo pgrx init --pg16 "/usr/lib/postgresql/16/bin/pg_config"

# Build and install pg_anonymizer
RUN git clone --tag ${PG_ANON_VERSION} \
      https://gitlab.com/dalibo/postgresql_anonymizer.git /tmp/pg_anonymizer \
 && cd /tmp/pg_anonymizer \
 && make extension PG_CONFIG=/usr/lib/postgresql/16/bin/pg_config PGVER=pg16 \
 && make install PG_CONFIG=/usr/lib/postgresql/16/bin/pg_config PGVER=pg16 \
 && rm -rf /tmp/pg_anonymizer
