# Arch Desktop Setup - Ansible

The `primary_user_password` in the `./group_vars/localhost/secrets.yml` vault is hashed with `mkpasswd --method=sha-512`

For `./roles/paru_install/` role, the `paru_install_repo_hash` commit hash is taken from `https://aur.archlinux.org/cgit/aur.git/log/?h=paru-bin`
