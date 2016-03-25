{% from 'git-lfs/map.jinja' import gitlfs with context %}

git-lfs-repo-key:
  cmd.run:
    - name: rpm --import https://packagecloud.io/github/git-lfs/gpgkey
    - unless: rpm -qi gpg-pubkey-d59097ab

git-lfs-repo:
  pkgrepo.managed:
    - humanname: Github Git LFS
    - baseurl: {{ gitlfs.repo }}
    - gpgcheck: 0
    - gpgkey: https://packagecloud.io/github/git-lfs/gpgkey
    - require:
      - cmd: git-lfs-repo-key

git-lfs:
  pkg.installed:
    - name: git-lfs
    - require:
      - pkgrepo: git-lfs-repo
