#
# == Class: tomcat::params
#
# Set some parameters based on the operating system.
#
class tomcat::params {

  case $::osfamily {
    default: { fail("unsupported OS: ${::osfamily}") }
    'RedHat': {
      $admin_package   = [ 'tomcat6-admin-webapps', 'tomcat6-webapps' ]
      $autodeploy_dir  = '/var/lib/tomcat6/webapps'
      $docs_package    = 'tomcat6-docs-webapp'
      $group           = 'tomcat'
      $service         = 'tomcat6'
      $staging_dir     = '/var/lib/tomcat6/staging'
      $package_name    = 'tomcat6'
      $user            = 'tomcat'
      $user_homedir    = '/usr/share/tomcat6'
    }
    'Debian': {

      # Determine tomcat version
      $v = $::lsbdistcodename ? {
        'xenial' => '8',
        default  => '6',
      }

      $policy_dir      = "/etc/tomcat${v}/policy.d"
      $admin_package   = "tomcat${v}-admin"
      $autodeploy_dir  = "/var/lib/tomcat${v}/webapps"
      $docs_package    = "tomcat${v}-docs"
      $group           = "tomcat${v}"
      $service         = "tomcat${v}"
      $staging_dir     = "/var/lib/tomcat${v}/staging"
      $package_name    = "tomcat${v}"
      $user            = "tomcat${v}"
      $user_homedir    = "/usr/share/tomcat${v}"
    }
    'Suse': {
      $admin_package   = [ 'tomcat6-admin-webapps', 'tomcat6-webapps' ]
      $autodeploy_dir  = '/usr/share/tomcat6/webapps'
      $docs_package    = 'tomcat6-docs-webapp'
      $group           = 'tomcat'
      $service         = 'tomcat6'
      $staging_dir     = '/usr/share/tomcat6/staging'
      $package_name    = 'tomcat6'
      $user            = 'tomcat'
      $user_homedir    = '/usr/share/tomcat6'
    }
  }

}
