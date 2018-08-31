class bdii::sambdii (
  $sitename = $bdii::params::sitename,
  $sitebdiihost = $bdii::params::sitebdiihost,
)inherits bdii::params {

  Class['bdii::config'] -> Class['bdii::sambdii']

  package { 'emi-bdii-top':
          ensure => present,
  }

  file {'/etc/bdii/gip/glite-info-site-defaults.conf':
      content => template('bdii/glite-info-site-defaults.erb'),
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
  }
}
