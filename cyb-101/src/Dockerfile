# Use the official Ubuntu base image
FROM ubuntu:24.04

# Set environment variables to avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update the package list, install required packages, and clean up
RUN apt update
RUN apt install -y xrdp openssh-server
RUN apt install -y python3 python3-pip
RUN apt install -y snapd
RUN apt install -y curl dnsutils openssh-client sudo
# python3-venv is required to create virtual environments below
RUN apt install -y python3-venv && rm -rf /var/lib/apt/lists/*
RUN apt clean && \
        rm -rf /var/lib/apt/lists/*

# Create a virtual environment
RUN python3 -m venv /opt/venv

# Activate the virtual environment and install vt-cli
# Note: Every RUN command runs in a new shell, so you need to activate the venv in the same RUN command where you use pip
RUN . /opt/venv/bin/activate && pip install vt-py

# Make sure the virtual environment is activated whenever the container runs
# This can be done by setting the PATH environment variable to include the virtual environment's bin directory
ENV PATH="/opt/venv/bin:$PATH"

# Create a new user named 'codepath' and set up sudo access
RUN useradd -m -s /bin/bash codepath && \
    echo 'codepath ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Set up SSH server
RUN mkdir /var/run/sshd

# Switch to the 'codepath' user
USER codepath
WORKDIR /home/codepath

# Create the .ssh directory and set the appropriate permissions
RUN mkdir -p /home/codepath/.ssh && \
    chmod 700 /home/codepath/.ssh && \
    chown -R codepath:codepath /home/codepath/.ssh

# Generate an SSH key pair named 'ubuntu_key'
RUN ssh-keygen -t rsa -b 4096 -f /home/codepath/.ssh/ubuntu_key -N ""

# Set permissions for the SSH directory and key files
RUN chmod 700 /home/codepath/.ssh && \
    chmod 600 /home/codepath/.ssh/ubuntu_key && \
    chmod 644 /home/codepath/.ssh/ubuntu_key.pub

# Download, make executable, and run the codepath install_tool.sh script
RUN wget https://raw.githubusercontent.com/codepath/cyb101-vm-setup/main/install_tool.sh && \
    chmod u+x install_tool.sh && \
    RUN printf "y\n1\ny\ny\ny" | ./install_tool.sh

# Switch back to the root user to finalize any configurations (optional)
USER root

# Set up RDP server
RUN adduser xrdp ssl-cert
RUN echo "startxfce4" > /home/codepath/.xsession

# Expose SSH and RDP ports
EXPOSE 22
EXPOSE 3389

# Copy the startup script into the container
COPY startup.sh /home/codepath/startup.sh

# Make the script executable
RUN chmod +x /home/codepath/startup.sh

# Set the default command to run the startup script
CMD ["/home/codepath/startup.sh"]
