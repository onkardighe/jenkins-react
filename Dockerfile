FROM jenkins/jenkins:lts

USER root

# Install Docker CLI
RUN apt-get update && \
    apt-get install -y docker.io && \
    apt-get clean

# Install plugins
COPY jenkins-plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli --plugin-file /usr/share/jenkins/ref/plugins.txt

# Add jenkins user to docker group
RUN usermod -aG docker jenkins

USER jenkins
