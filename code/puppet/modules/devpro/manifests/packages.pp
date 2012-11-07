class devpro::packages {

  package {
    'libevent-1.4-2': ensure => 'installed', provider => 'apt';
    'libevent-dev': ensure => 'installed', provider => 'apt';
    'emacs23': ensure => 'installed', provider => 'apt';
    'git-core': ensure => 'installed', provider => 'apt';
    'libxml2-dev': ensure => 'installed', provider => 'apt';
    'libxslt1-dev': ensure => 'installed', provider => 'apt';
    'unzip': ensure => 'installed', provider => 'apt';
    'gettext': ensure => 'installed', provider => 'apt';
    'libjpeg-dev': ensure => 'installed', provider => 'apt';
    'curl': ensure => 'installed', provider => 'apt';
    'openssl': ensure => 'installed', provider => 'apt';
    'libcurl4-openssl-dev': ensure => 'installed', provider => 'apt';
    'supervisor': ensure => 'installed', provider => 'apt';
  }
  
}
