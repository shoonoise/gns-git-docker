git-server-docker
=================

Git server over ssh

Server listen `2222` port.

Public-key authentication, keys adds from `$KEYS` variable on start time.

Fast start
-------

*Expected than you are already have a generated ssh key.*

Start docker container:
```bash
git clone https://github.com/shoonoise/git-server-docker.git
cd git-server-docker
docker build -t="srv" .
docker run  -d -e KEY="`cat ~/.ssh/id_rsa.pub`" -p 2222:2222 git-srv
```

After that you can commit to you container:
```bash
cd project
git init
touch README.md
git add README.md
git commit -m "Init"
git remote add origin git@localhost:2222/gns-rules.git
git push origin master```
