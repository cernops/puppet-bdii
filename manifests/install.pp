class bdii::install (
  $selinux = $bdii::params::selinux
) inherits bdii::params {

  package { bdii:
    ensure => present,
  }

}
