# Builder Stage: install dependencies and build the virtual environment
FROM debian:stable-20230814-slim AS builder

# Install Python 3.11, venv, and pip without extra packages/caches
RUN apt-get update && \
    apt-get install -y --no-install-recommends python3.11 python3.11-venv python3-pip && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /home/Documents

# Create virtual environment and install required packages
RUN python3 -m venv virtual_env && \
    /bin/bash -c "source virtual_env/bin/activate && pip install --upgrade pip && \
                  pip install --no-cache-dir uv && \
                  uv pip install --no-cache-dir psutil jupyterlab"

# Copy requirements and install additional packages
COPY official_requirements.txt ./
RUN /bin/bash -c "source virtual_env/bin/activate && uv pip install --no-cache-dir -r official_requirements.txt"


# Final Stage: set up runtime environment with minimal footprint
FROM debian:stable-20230814-slim

# Install only runtime dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends python3.11 python3.11-venv python3-pip && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /home/Documents

# Copy the pre-built virtual environment from the builder stage
COPY --from=builder /home/Documents/virtual_env ./virtual_env

# Ensure workspace directory exists
RUN mkdir -p workspace

EXPOSE 8888

CMD ["/bin/bash", "-c", "source virtual_env/bin/activate && jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root --NotebookApp.token='' --notebook-dir=workspace"]
