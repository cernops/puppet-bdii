class bdii::sitebdii(
  #this allows to override specific params not only relying on hiera, for sites which have subsite BDIIs, wishing to use hiera both for site and subsite
  $siteurls              =  $bdii::params::siteurls,
  $sitename              =  $bdii::params::sitename,
  $sitebdiihost          =  $bdii::params::sitebdiihost,
  $sitedesc              =  $bdii::params::sitedesc,
  $siteweb               =  $bdii::params::siteweb,
  $sitedistributed       =  $bdii::params::sitedistributed,
  $siteloc               =  $bdii::params::siteloc,
  $sitecountry           =  $bdii::params::sitecountry,
  $sitelat               =  $bdii::params::sitelat,
  $sitelong              =  $bdii::params::sitelong,
  $siteemail             =  $bdii::params::siteemail,
  $sitesecuritymail      =  $bdii::params::sitesecuritymail,
  $sitesupportemail      =  $bdii::params::sitesupportemail,
  $config                =  $bdii::params::config,
  $egeeroc               =  $bdii::params::egeeroc,
  $egeeservice           =  $bdii::params::egeeservice,
  $grid                  =  $bdii::params::grid,
  $wlcgtier              =  $bdii::params::wlcgtier,
  $otherinfo             =  $bdii::params::otherinfo,

) inherits bdii::params {

  Class[Bdii::Config] -> Class[Bdii::Sitebdii]

  package { 'emi-bdii-site':
          ensure => present,
      }

  file {'/etc/glite-info-static/site/site.cfg':
      content => template('bdii/site.erb'),
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
  }
  file {'/etc/bdii/gip/glite-info-site-defaults.conf':
      content => template('bdii/glite-info-site-defaults-site.erb'),
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
  }

  file {'/etc/bdii/gip/site-urls.conf':
      content => template('bdii/site_urls.erb'),
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
  }
}
