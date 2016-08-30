#
# == Class: tomcat::config
#
# Configure Tomcat
#
class tomcat::config
(
    Enum['present','absent'] $ensure

) inherits tomcat::params {

    $ensure_dir = $ensure ? {
        'present' => 'directory',
        'absent' => 'absent'
    }

    file { $::tomcat::params::autodeploy_dir:
        ensure  => $ensure_dir,
        require => Class['tomcat::install'],
    }

    file { $::tomcat::params::staging_dir:
        ensure  => $ensure_dir,
        require => Class['tomcat::install'],
    }
}
