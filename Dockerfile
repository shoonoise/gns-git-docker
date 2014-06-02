# Dockerfile for Git
# Special for GNS project, but may be used for common purposes

FROM yandex/ubuntu
MAINTAINER Alexander Kushnarev <avkushnrev@gmail.com>

RUN apt-get update
RUN apt-get install -y git openssh-server

RUN adduser git
RUN mkdir /home/git/.ssh
RUN touch /home/git/.ssh/authorized_keys
RUN chown -R git /home/git/.ssh

RUN mkdir /gns-rules.git
WORKDIR /gns-rules.git
RUN chown git /gns-rules.git
RUN git --bare init
RUN chown -R git /gns-rules.git
RUN chown -R git /gns-rules

RUN mkdir /gns-rules
ADD post-receive /gns-rules.git/hooks/

ADD sshd_config /etc/ssh/sshd_config
RUN mkdir /var/run/sshd/
RUN chmod 0755 /var/run/sshd
ADD run.sh /

CMD /run.sh
