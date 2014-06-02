# Dockerfile for Git
# Special for GNS project, but may be used for common purposes

FROM yandex/ubuntu
MAINTAINER Alexander Kushnarev <avkushnrev@gmail.com>

RUN apt-get update
RUN apt-get install -y git openssh-server

RUN adduser --disabled-password --gecos "" git
RUN mkdir /home/git/.ssh
RUN touch /home/git/.ssh/authorized_keys

RUN mkdir /gns-rules.git
WORKDIR /gns-rules.git
RUN git --bare init
ADD post-receive /gns-rules.git/hooks/

RUN mkdir /gns-rules
RUN chown -R git /gns-rules
# Looks like some Docker's issue. `chmod -R git /gns-rules.git` does not work.
RUN chmod -R 777 /gns-rules.git

ADD sshd_config /etc/ssh/sshd_config
RUN mkdir /var/run/sshd/
RUN chmod 0755 /var/run/sshd
ADD run.sh /

EXPOSE 22

CMD /run.sh
