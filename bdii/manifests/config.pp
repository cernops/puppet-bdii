class bdii::config (
  $log_level  = $bdii::params::log_level,
  $port      = $bdii::params::port,
  $user      = $bdii::params::user,
  $slapdconf = $bdii::params::slapdconf
) inherits bdii::params {

      Class[Bdii::Install] -> Class[Bdii::Config]

      file {"/etc/bdii/bdii.conf":
         content => template('bdii/bdiiconf.erb'),
         owner   => 'root',
         group   => 'root',
         mode    => '644',
         notify  => Class["bdii::service"]
      }

      file { "/etc/bdii/gip":
        ensure => "directory",
        owner  => "root",
        group  => "root",
        mode   => 755
      }

      file { "/var/lib/bdii/db":
        ensure => "directory",
        owner  => "ldap",
        group  => "ldap",
        mode   => 755
      }

      file {"/etc/sysconfig/bdii":
        content => template('bdii/bdiisysconf.erb'),
        owner => 'root',
        group => 'root',
        mode => '644'
      }

}
