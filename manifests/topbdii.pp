class bdii::topbdii (
  $sitename = $bdii::params::sitename,
  $sitebdiihost = $bdii::params::sitebdiihost,
) inherits bdii::params {

  include ::bdii

  Class['bdii::config'] -> Class['bdii::topbdii']

  package { 'emi-bdii-top':
          ensure => 'present',
      }

  file {'/etc/bdii/gip/glite-info-site-defaults.conf':
      content => template('bdii/glite-info-site-defaults.erb'),
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
  }

  file {'/etc/glite/glite-info-update-endpoints.conf':
      content => template('bdii/glite-info-update-endpoints.erb'),
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
  }
}
