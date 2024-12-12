# Use an official CUDA runtime as the base image
FROM pytorch/pytorch:2.5.1-cuda12.1-cudnn9-devel

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive \
    CUDA_HOME=/usr/local/cuda \
    TORCH_CUDA_ARCH_LIST="8.0 8.6 8.7 8.9"


COPY . /GaussianPro
WORKDIR /GaussianPro
    
# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    wget \
    build-essential \
    libgl1-mesa-glx \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip
RUN python3 -m pip install --upgrade pip

# Install Python dependencies using pip
RUN --mount=type=cache,target=/root/.cache/pip  pip install -r docker/requirements.txt


# Install additional submodule packages
RUN --mount=type=cache,target=/root/.cache/pip  pip install submodules/Propagation \
    submodules/diff-gaussian-rasterization \
    submodules/simple-knn


# Make the entrypoint script executable
RUN chmod +x docker/entrypoint.sh

# Set the entrypoint to the script
ENTRYPOINT ["docker/entrypoint.sh"]

# Set the default command to bash to keep the container running
CMD ["/bin/bash"]
