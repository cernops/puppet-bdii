class bdii::config (
  $log_level    = $bdii::params::log_level,
  $port         = $bdii::params::port,
  $user         = $bdii::params::user,
  $slapdconf    = $bdii::params::slapdconf,
  $delete_delay = $bdii::params::bdiideletedelay,
  $loglevel   = undef,
) inherits bdii::params {

      Class[bdii::install] -> Class[bdii::config]

      file {'/etc/bdii/bdii.conf':
        content  => template('bdii/bdiiconf.erb'),
        owner    => 'root',
        group    => 'root',
        mode     => '0644',
        notify   => Class['bdii::service'],
        loglevel => $loglevel,
      }

      file { '/etc/bdii/gip':
        ensure   => 'directory',
        owner    => 'root',
        group    => 'root',
        mode     => '0755',
        loglevel => $loglevel,
      }

      file { '/var/lib/bdii/db':
        ensure   => 'directory',
        owner    => 'ldap',
        group    => 'ldap',
        mode     => '0755',
        loglevel => $loglevel,
      }

      file {'/etc/sysconfig/bdii':
        content  => template('bdii/bdiisysconf.erb'),
        owner    => 'root',
        group    => 'root',
        mode     => '0644',
        loglevel => $loglevel,
      }

      file_line{ 'slapd_threads':
        path   => $slapdconf,
        match  => '^\s*threads',
        line   => "threads          ${bdii::params::slapdthreads}",
      }

      file_line{ 'slapd_loglevel':
        path   => $slapdconf,
        match  => '^\s*loglevel',
        line   => "loglevel       ${bdii::params::slapdloglevel}",
      }
}
