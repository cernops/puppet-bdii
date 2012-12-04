class bdii::sitebdii {

  $slapdconf = "/etc/bdii/bdii-slapd.conf"

  package { emi-bdii-site:
          ensure => present,
          require => Class["emi2repos"],
      }
  
  file {"/etc/glite-info-static/site/site.cfg":
      content => template('bdii/site.erb'),
      owner => 'root',
      group => 'root',
      mode => '644',    
      require => Class["bdii::config"],
  }
  file {"/etc/bdii/gip/glite-info-site-defaults.conf":
      content => template('bdii/glite-info-site-defaults-site.erb'),
      owner => 'root',
      group => 'root',
      mode => '644',    
      require => Class["bdii::config"],
  }
  file {"/etc/bdii/gip/site-urls.conf":
      content => template('bdii/site_urls.erb'),
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
}

