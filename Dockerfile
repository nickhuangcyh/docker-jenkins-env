FROM jenkins/jenkins:lts-jdk17

LABEL maintainer="NickHuang <nickhuang@climax.com.tw>"

USER root

# Set up Docker's apt repository.
RUN apt-get update
RUN apt-get install ca-certificates curl
RUN install -m 0755 -d /etc/apt/keyrings
RUN curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
RUN chmod a+r /etc/apt/keyrings/docker.asc
# Add the repository to Apt sources:
RUN echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
$(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
tee /etc/apt/sources.list.d/docker.list > /dev/null
RUN apt-get update

# Install the Docker packages
RUN yes | apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
RUN docker 
RUN docker --version

# Install vim
RUN yes | apt-get install vim

# Install zip, unzip
RUN yes | apt-get install zip unzip

# Install python3
RUN yes | apt-get install python3

USER jenkins


