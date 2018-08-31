class bdii::config (
  $log_level    = $bdii::log_level,
  $port         = $bdii::port,
  $user         = $bdii::user,
  $slapdconf    = $bdii::slapdconf,
  $delete_delay = $bdii::delete_delay,
) inherits bdii {

      Class[bdii::install] -> Class[bdii::config]

      file {'/etc/bdii/bdii.conf':
        content => template('bdii/bdiiconf.erb'),
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        notify  => Class['bdii::service'],
      }

      file { '/etc/bdii/gip':
        ensure => 'directory',
        owner  => 'root',
        group  => 'root',
        mode   => '0755',
      }

      file { '/var/lib/bdii/db':
        ensure => 'directory',
        owner  => 'ldap',
        group  => 'ldap',
        mode   => '0755',
      }

      file {'/etc/sysconfig/bdii':
        content => template('bdii/bdiisysconf.erb'),
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
      }

      file_line{ 'slapd_threads':
        path  => $slapdconf,
        match => '^\s*threads',
        line  => "threads          ${bdii::params::slapdthreads}",
      }

      file_line{ 'slapd_loglevel':
        path  => $slapdconf,
        match => '^\s*loglevel',
        line  => "loglevel       ${bdii::params::slapdloglevel}",
      }
}
