class bdii::topbdii inherits bdii::params {

  Class[Bdii::Config] -> Class[Bdii::Topbdii]

  if defined( Class["bdii"]) {
    fail("Do not include / declare top level bdii class when using bdii::sitebdii")
  }
  include bdii::install
  include bdii::firewall
  class{"bdii::config":
    delete_delay => $bdii::params::bdiideletedelay,
  }

  package { emi-bdii-top:
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
  
