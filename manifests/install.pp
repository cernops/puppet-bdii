class bdii::install (
  $selinux              = $bdii::selinux,
) inherits ::bdii {

  package { 'bdii':
    ensure => present,
  }

  if $selinux {
    package { 'selinux-policy-targeted-emi2-bdii':
      ensure => present,
    }
    package { 'selinux-policy-targeted-emi2-hotfixes':
      ensure => present,
    }
  }
}
