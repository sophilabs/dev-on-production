# Bootstrap on Development or Test Machine (one time)

## Setup

### Install Ruby (required for Vagrant)

* https://rvm.io/rvm/install/


### Install VirtualBox and Vagrant

* Download and install VirtualBox from https://www.virtualbox.org/wiki/Downloads
* Download and install Vagrant from http://downloads.vagrantup.com/tags

### Edit /etc/hosts and add (first time):

    127.0.0.1 local.devpro.sophilabs.com

## Run

    $ vagrant up
    $ vagrant ssh

    $ python manage.py runserver


## View

    http://local.devpro.sophilabs.com/

