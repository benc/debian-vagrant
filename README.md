# Machines

These are my virtual machine configurations, built using [Ansible](http://www.ansible.com/home) and [Docker](https://www.docker.io/). 

The host and docker containers are based on [Ubuntu 12.04 LTS](https://wiki.ubuntu.com/LTS) to make them runnable on DigitalOcean. 

## Ansible

### Common

The Ansible common role installs and configures:

* ntp
* base docker image: updates LTS, sets up ntp, [openssh](http://www.openssh.com/), [supervisord](http://supervisord.org/)
* provides a leader [etcd](https://github.com/coreos/etcd) instance
* [ufw](https://launchpad.net/ufw)
* users: [zsh](http://www.zsh.org/), [zprezto](https://github.com/sorin-ionescu/prezto) and their configured dotfiles (must be configurable using [rcm](https://github.com/thoughtbot/rcm))

The public keys of all users are added to the docker images through SSH.

### Roles

Available Ansible roles/Dockerfiles

* [MongoDB](http://www.mongodb.org/) (untested!)
* [Postgres 9.3](http://www.postgresql.org/) using a data only container, running an etcd 'postgres' instance.
* [Node.js](http://nodejs.org/)
* Ruby (sets up a multi user [rvm](http://rvm.io/) install)
* [PhantomJS](http://phantomjs.org/)
* [Passenger](https://www.phusionpassenger.com/) with ruby and node.js preconfigured, running an etcd 'passenger' instance.
* [Ghost](https://ghost.org/) with the [N-Coded](https://github.com/polygonix/N-Coded) theme

## Docker

* Dockerfiles aren't pushed to the central docker index, they are built and kept on the machine.
* Every running Docker container has an etcd instance running. 
* Docker containers are linked using [etcd cluster discovery](https://coreos.com/docs/cluster-management/setup/etcd-cluster-discovery/).

## Vagrant

I use [vagrant](http://www.vagrantup.com/) to test these images. The insecure vagrant public key is removed upon start, all configured public keys are added to the vagrant user by ansible.

## Digital Ocean

After testing, these playbooks are used to build my [digital ocean](https://www.digitalocean.com/) droplets.

# License

Copyright (C) 2014 Ben Cochez

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/benc/machines/trend.png)](https://bitdeli.com/free "Bitdeli Badge")
