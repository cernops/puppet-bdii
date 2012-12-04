class bdii::config {
      file {"/etc/bdii/bdii.conf":
         content => template('bdii/bdiiconf.erb'),
         owner   => 'root',
         group   => 'root',
         mode    => '644',
	 require => Class["bdii::install"], 
         notify  => Class["bdii::service"],
      }

      file { "/etc/bdii/gip":
        ensure => "directory",
        owner  => "root",
        group  => "root",
        mode   => 755,
        require => Class["bdii::install"],
      }

      file { "/var/lib/bdii/db":
        ensure => "directory",
        owner  => "ldap",
        group  => "ldap",
        mode   => 755,
        require => Class["bdii::install"],
      }
}