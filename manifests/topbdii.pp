class bdii::topbdii {

  $slapdconf = "/etc/bdii/bdii-top-slapd.conf"

  package { emi-bdii-top:
          ensure => present,
          require => Class["emi2repos"],
      }

  $bdii_passwd=hiera("bdii_passwd",'secret')

  file {"/etc/bdii/gip/glite-info-site-defaults.conf":
      content => template('bdii/glite-info-site-defaults.erb'),
      owner => 'root',
      group => 'root',
      mode => '644',    
      require => Class["bdii::config"],
  }

  file {"/etc/sysconfig/bdii":
      content => template('bdii/bdiisysconf.erb'),
      owner => 'root',
      group => 'root',
      mode => '644',
     require => Class["bdii::config"],
  }
  #file {"/etc/bdii/bdii-top-slapd.conf":
  #    content => template('bdii/bdii-slapd.erb'),
  #    owner => 'ldap',
  #    group => 'ldap',
  #    mode => '640',
  #}
}
  
