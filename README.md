# Machines

These are my virtual machine configurations, built using Ansible and Docker. Host and docker containers are based on Ubuntu 12.04 LTS.

## Ansible

### Common

The Ansible common role installs and configures:

* ntp
* node
* ruby: 2.1, rake and pry
* base docker image: updates LTS, sets up ntp, openssh, supervisor
* users: zsh, zprezto and their configured dotfiles

Their public keys are added to the vagrant user, and are also granted access to all the docker images through SSH.

### Roles

Available Ansible roles/Dockerfiles

* Passenger with ruby and node
* Mongodb
* Postgres
* A blog role which sets up a configured passenger Dockerfile running Ghost

# License

Copyright (C) 2014 Ben Cochez

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
