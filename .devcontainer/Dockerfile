FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    ca-certificates \
    curl \
    file \
    git \
    libssl-dev \
    pkg-config \
    sudo \
    binaryen \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -m -s /bin/bash -u 1000 dev && \
    echo "dev ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/dev && \
    chmod 0440 /etc/sudoers.d/dev && \
    mkdir -p /workspace/.sccache && \
    chown dev:dev /workspace/.sccache && \
    mkdir -p /home/dev/logs && \
    chown dev:dev /home/dev/logs

USER dev
WORKDIR /home/dev

# Install Rust with WebAssembly support
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --default-toolchain 1.81 -y && \
    ~/.cargo/bin/rustup target add --toolchain 1.81 wasm32-unknown-unknown && \
    ~/.cargo/bin/rustup component add --toolchain 1.81 rust-src && \
    ~/.cargo/bin/rustup default 1.81

ENV PATH="/home/dev/.cargo/bin:/home/linuxbrew/.linuxbrew/bin:${PATH}" \
    CARGO_REGISTRIES_CRATES_IO_PROTOCOL=sparse \
    RUSTC_WRAPPER=sccache \
    SCCACHE_CACHE_SIZE=5G \
    SCCACHE_DIR=/workspace/.sccache \
    HOMEBREW_NO_AUTO_UPDATE=1

# Install Homebrew and tools
RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" && \
    /home/linuxbrew/.linuxbrew/bin/brew install stellar-cli sccache cargo-watch

CMD ["/bin/bash"]