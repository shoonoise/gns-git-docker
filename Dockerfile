# Dockerfile for Git
# Special for GNS project, but may be used for common purposes

FROM yandex/trusty
MAINTAINER Alexander Kushnarev <avkushnrev@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y git openssh-server

RUN useradd -o -u 0 --system --shell=/usr/bin/git-shell  git

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
