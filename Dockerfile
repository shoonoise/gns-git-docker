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
VOLUME ["/keys"]

CMD /run.sh
