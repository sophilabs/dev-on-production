define ssh::sshkeys($home_dir, $username, $group, $source_filename) {
  file { "${home_dir}/.ssh":
    ensure => directory,
    owner => $username,
    group => $group,
    mode => 755;
  }

  file { "${home_dir}/.ssh/id_rsa":
    ensure => present,
    owner => $username,
    group => $group,
    mode => 600,
    source => $source_filename,
    require => File["${home_dir}/.ssh"];
  }

  file { "${home_dir}/.ssh/id_rsa.pub":
    ensure => present,
    owner => $username,
    group => $group,
    mode => 644,
    source => "${source_filename}.pub",
    require => File["${home_dir}/.ssh"];
  }
}
