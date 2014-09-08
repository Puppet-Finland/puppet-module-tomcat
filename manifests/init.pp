class tomcat (
  $version = 'present',
  $package = $tomcat::params::tomcat_package,
  $allow_address_ipv4 = '127.0.0.1',
  $allow_address_ipv6 = '::1'

) inherits tomcat::params {
  include java

  package { 'tomcat':
    ensure => $version,
    name   => $package,
    before => Service['tomcat'],
  }

  service { 'tomcat':
    ensure => running,
    enable => true,
    name   => $tomcat::params::service,
  }

  file { $tomcat::params::autodeploy_dir:
    ensure  => directory,
  }
  file { $tomcat::params::staging_dir:
    ensure  => directory,
  }

  if tagged('packetfilter') {
    class { 'tomcat::packetfilter':
      allow_address_ipv4 => $allow_address_ipv4,
      allow_address_ipv6 => $allow_address_ipv6,
    }
  }
}
