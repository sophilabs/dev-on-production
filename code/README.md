#Django + Vagrant + Puppet + Fabric + VirtualEnv

This repository contains a test django project (app folder) among example configuration files for puppet, vagrant and fabric.
The main objetive of this project is to introduce on using isolated environments for multiple devs, projects and machines.


# Bootstrap on dev machine (one time)

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

    browser: http://local.devpro.sophilabs.com/

## Remote

Run provision using fabric from dev machine (a dummy example)

    fab dev provision