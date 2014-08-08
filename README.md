# Machines

These are my virtual machine configurations, built using [Ansible](http://www.ansible.com/home). The host is based on [Ubuntu 14.04 LTS](https://wiki.ubuntu.com/LTS).

## Ansible

### Common

The Ansible common role installs and configures:

* ntp
* [ufw](https://launchpad.net/ufw)
* users: [zsh](http://www.zsh.org/), [zprezto](https://github.com/sorin-ionescu/prezto) and their configured dotfiles (must be configurable using [rcm](https://github.com/thoughtbot/rcm))

### Roles

Available Ansible roles

* [Postgres 9.3](http://www.postgresql.org/)
* [Node.js](http://nodejs.org/)
* Ruby (sets up a multi user [rvm](http://rvm.io/) install)
* [PhantomJS](http://phantomjs.org/)
* Java
* Teamcity
* Upsource (EAP)

## Vagrant

I use [vagrant](http://www.vagrantup.com/) to test these images. The insecure vagrant public key is removed upon start, all configured public keys are added to the vagrant user by ansible.

## Digital Ocean

After testing, these playbooks are used to build my greenqloud instances.

# License

Copyright (C) 2014 Ben Cochez

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
