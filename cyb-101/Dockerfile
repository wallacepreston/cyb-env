# Use the official Ubuntu base image
FROM ubuntu:24.04

# Set environment variables to avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update the package list, install required packages, and clean up
RUN apt update && \
    apt install -y curl dnsutils openssh-client sudo && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

# Create a new user named 'codepath' and set up sudo access
RUN useradd -m -s /bin/bash codepath && \
    echo 'codepath ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Switch to the 'codepath' user
USER codepath
WORKDIR /home/codepath

# Generate an SSH key pair named 'ubuntu_key'
RUN ssh-keygen -t rsa -b 4096 -f /home/codepath/.ssh/ubuntu_key -N ""

# Set permissions for the SSH directory and key files
RUN chmod 700 /home/codepath/.ssh && \
    chmod 600 /home/codepath/.ssh/ubuntu_key && \
    chmod 644 /home/codepath/.ssh/ubuntu_key.pub

# Switch back to the root user to finalize any configurations (optional)
USER root

# Set the default command to bash
CMD ["bash"]
