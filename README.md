git-server-docker
======

Git server over ssh

Public-key authentication, keys adds from `$KEY` variable on start time.

Fast start
-------

*Expected than you are already have a generated ssh key.*

**Start docker container:**

1. Clone repo:
> ```bash
git clone https://github.com/shoonoise/gns-git-docker.git
cd gns-git-docker
```
2. Build Docker image:
> ```bash
docker build -t="git-srv" .
```
3. Run container:
> ```bash
docker run  -d -e KEY="`cat ~/.ssh/id_rsa.pub`" -v /tmp/gns-rules:/gns-rules:rw  -v /tmp/gns-rules.git:/gns-rules.git:rw -v /tmp/keys:/keys:rw -p 2222:22 git-srv
```

**After that you can use container:**

1. Create new repo (you can skip it, if you already have one):
> ```bash
cd project
git init
```
2. Make changes:
> ```bash
touch README.md
git add README.md
git commit -m "Init"
```
3. Add container as remore origin
> ```bash
git remote add origin ssh://git@localhost:2222/gns-rules.git
```
4. Now you can push into container:
> ```bash
git push origin master
```
