git-server-docker
=================

Git server over ssh

Public-key authentication, keys adds from `$KEY` variable on start time.

Fast start
-------

*Expected than you are already have a generated ssh key.*

Start docker container:
```bash
git clone https://github.com/shoonoise/git-server-docker.git
cd git-server-docker
docker build -t="srv" .
docker run  -d -e KEY="`cat ~/.ssh/id_rsa.pub`" -v /tmp/gns-rules:/gns-rules:rw -p 2222:22 git-srv
```

After that you can commit to you container:

```bash
cd project
git init
touch README.md
git add README.md
git commit -m "Init"
git remote add origin ssh://git@localhost:2222/gns-rules.git
git push origin master
```
