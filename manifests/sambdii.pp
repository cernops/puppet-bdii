class bdii::sambdii inherits bdii::params {

  Class[Bdii::Config] -> Class[Bdii::Sambdii]

  package { "emi-bdii-top":
          ensure => present,
  }

  file {"/etc/bdii/gip/glite-info-site-defaults.conf":
      content => template('bdii/glite-info-site-defaults.erb'),
      owner => 'root',
      group => 'root',
      mode => '644',
      loglevel => err,
  }
}
  
