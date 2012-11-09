class devpro ($target, $domain, $base_dir, $user, $group) {

    $source_dir = "${base_dir}/source"
    $log_dir = "${base_dir}/log"
    $run_dir = "${base_dir}/run"
    $venv_dir = "${base_dir}/venv"

    $code_dir = "${source_dir}/code"
    $app_dir = "${code_dir}/app"

    Exec {
        path => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
    }

    class { "apt":
        always_apt_update => true;
    }

    class { "devpro::packages":
        require => Class["apt"];
    }

    file {
        $base_dir:
            owner => $user,
            group => $group,
            ensure => directory;
        $run_dir:
            owner => $user,
            group => $group,
            ensure => directory,
            require => File[$base_dir];
        $log_dir:
            owner => $user,
            group => $group,
            ensure => directory,
            require => File[$base_dir];
        $source_dir:
            owner => $user,
            group => $group,
            ensure => directory,
            require => File[$base_dir];
    }

    if $target == "dev" {
        file { "/home/${user}/.bashrc":
            owner => $user,
            group => $group,
            mode => "755",
            content => template("devpro/bashrc.erb");
        }
    }


    class { "devpro::app":
        require => [Class["devpro::packages"], File[$source_dir], File[$run_dir]];
    }

}