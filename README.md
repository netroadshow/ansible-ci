# Ansible CI Container

This is a docker container containing tooling needs for running ansible against infrastructure.

## Tooling

Some of the tooling includes:

- Ansible 2.8 on Python 3.7
- AWS CLI
- Terraform
- Packer
- Jinja CLI (for standalone templating)

For a list of apt packages installed, see [the apt package list](install/apt.txt).
For a list of python packages installed, see [the pip requirements.txt](install/requirements.txt).
