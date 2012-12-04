class bdii::install {
  package { bdii:
    ensure => present,
    require => Class["emi2repos"]
  }   
}
