git-server-docker
======

Git server over ssh

Public-key authentication, keys adds from `$KEY` variable on start time.

Fast start
-------

*Expected than you are already have a generated ssh key.*

**Start docker container:**

- Clone repo:

  ```bash
  git clone https://github.com/shoonoise/gns-git-docker.git
  cd gns-git-docker
  ```

- Build Docker image:

  ```bash
  docker build -t="git-srv" .
  ```

- Run container:

  ```bash
  docker run  -d -e KEY="`cat ~/.ssh/id_rsa.pub`" -v /tmp/gns-rules:/gns-rules:rw  -v /tmp/gns-rules.git:/gns-rules.git:rw -v /tmp/keys:/keys:rw -p 2222:22 git-srv
  ```

**After that you can use container:**

- Create new repo (*you can skip it, if you already have one*):

  ```bash
  mkdir project
  cd project
  git init
  ```

- Make changes:

  ```bash
  touch README.md
  git add README.md
  git commit -m "Init"
  ```

- Add container as remore origin

  ```bash
  git remote add origin ssh://git@localhost:2222/gns-rules.git
  ```

- Now you can push into container:

  ```bash
  git push origin master
  ```
