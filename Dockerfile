FROM rundeck/rundeck:3.2.6
MAINTAINER Ihar Patupchyk <ihar.patupchyk@kaseya.com>
USER root
RUN apt-get update && apt-get install -y git python3 unzip
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN python3 get-pip.py
RUN pip3 install ansible boto botocore
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install
COPY --chown=rundeck:root rundeck-config.properties /etc/remco/templates/
COPY --chown=rundeck:root rundeck-ec2-nodes-plugin-1.5.14.jar /home/rundeck/libext/
USER rundeck
