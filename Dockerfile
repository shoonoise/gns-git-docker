# Dockerfile for Git
# Special for GNS project, but may be used for common purposes

FROM yandex/ubuntu
MAINTAINER Alexander Kushnarev <avkushnrev@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y git openssh-server

RUN adduser --disabled-password --gecos "" --shell=/usr/bin/git-shell  git
RUN mkdir /home/git/.ssh
RUN touch /home/git/.ssh/authorized_keys

# All keys from `/keys/pub_keys` will be added as authorized keys
# Also you can mount  this dir as a voulme to add keys
RUN mkdir /keys
RUN touch /keys/pub_keys

ADD post-receive /post-receive
RUN mkdir /gns-rules.git
RUN mkdir /gns-rules

ADD sshd_config /etc/ssh/sshd_config
RUN mkdir /var/run/sshd/
RUN chmod 0755 /var/run/sshd
ADD run.sh /

EXPOSE 22
VOLUME ["/keys", "/gns-rules", "/gns-rules.git"]

CMD /run.sh
