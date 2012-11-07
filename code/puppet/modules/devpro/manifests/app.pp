class devpro::app {

    class { 'python::dev': }

    class { 'python::venv':
        owner => $user,
        group => $group,
        require => Class['python::dev'];
    }

    python::venv::isolate { $venv_dir:
        requirements => "${code_dir}/requirements.pip",
        require => Class['python::venv'];
    }

    file { "${app_dir}/devpro/local_settings.py":
        require => File[$source_dir],
        content => template("${module_name}/settings.py.erb");
    }

    #TODO: add mongo

    class { "::nginx": }



    nginx::vhost { $domain:
        name => "devpro",
        content => template("${module_name}/vhost.nginx.erb"),
        require => Class["::nginx"];
    }

    if $target == 'pro' {

        file { "/etc/supervisor/conf.d/devpro.conf":
            require => Service["supervisor::devpro"],
            content => template("${module_name}/supervisord.conf.erb");
        }

        service { "supervisor::devpro":
            ensure => "running",
            provider => base,
            restart => "/usr/bin/supervisorctl restart devpro",
            start    => "/usr/bin/supervisorctl start devpro",
            status   => "/usr/bin/supervisorctl status | awk '/^devpro/{print \$2}' | grep '^RUNNING$'",
            stop     => "/usr/bin/supervisorctl stop devpro",
            subscribe => File["${app_dir}/devpro/local_settings.py"];
        }
    }

}