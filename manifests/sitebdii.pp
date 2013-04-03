class bdii::sitebdii {

  Class[Bdii::Config] -> Class[Bdii::Sitebdii]

  package { emi-bdii-site:
          ensure => present,
      }
  
  file {"/etc/glite-info-static/site/site.cfg":
      content => template('bdii/site.erb'),
      owner => 'root',
      group => 'root',
      mode => '644'
  }
  file {"/etc/bdii/gip/glite-info-site-defaults.conf":
      content => template('bdii/glite-info-site-defaults-site.erb'),
      owner => 'root',
      group => 'root',
      mode => '644'
  }
  file {"/etc/bdii/gip/site-urls.conf":
      content => template('bdii/site_urls.erb'),
      owner => 'root',
      group => 'root',
      mode => '644'
  }

}

