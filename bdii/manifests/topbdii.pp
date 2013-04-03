class bdii::topbdii {

  Class[Bdii::Config] -> Class[Bdii::Topbdii]

  package { emi-bdii-top:
          ensure => present,
      }

  $bdii_passwd=hiera("bdii_passwd",'secret')

  file {"/etc/bdii/gip/glite-info-site-defaults.conf":
      content => template('bdii/glite-info-site-defaults.erb'),
      owner => 'root',
      group => 'root',
      mode => '644'
  }

  #file {"/etc/bdii/bdii-top-slapd.conf":
  #    content => template('bdii/bdii-slapd.erb'),
  #    owner => 'ldap',
  #    group => 'ldap',
  #    mode => '640',
  #}
}
  
