#
# == Class: tomcat::service
#
# Enable Tomcat on boot
#
class tomcat::service
(
    $ensure

) inherits tomcat::params
{
    # Service should be disabled if Tomcat is absent
    $enable = $ensure ? {
        'present' => true,
        'absent' => false
    }

    service { 'tomcat':
        enable  => $enable,
        name    => $::tomcat::params::service,
        require => Class['tomcat::install'],
    }
}
