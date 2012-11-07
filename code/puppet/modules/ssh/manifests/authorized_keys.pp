define ssh::authorized_keys($home_dir, $username, $group, $source_filename) {
  file { "${home_dir}/.ssh/authorized_keys":
    ensure => present,
    owner => $username,
    group => $group,
    mode => 600,
    source => $source_filename,
    require => File["${home_dir}/.ssh"];
  }
}
