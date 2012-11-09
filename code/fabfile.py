import os
from fabric.api import sudo, env, local

def dev():
    env.hosts = ['127.0.0.1:2222']
    env.user = 'vagrant'
    env.key_filename = local('vagrant ssh-config | grep IdentityFile', capture=True).split()[1]
    env.puppet_entry = 'dev'
    env.puppet_base = '/opt/devpro/source/code/puppet'

def pro():
    raise NotImplementedError


def provision():
    sudo("puppet apply -d -v --modulepath={0}/modules {0}/{1}.pp ".format(env.puppet_base, env.puppet_entry))
