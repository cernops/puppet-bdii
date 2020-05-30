# This file is here only to keep compatibility with older versions
# of puppet BDII module. Don't use this file and don't use bdii::params::*
# in hiera configuration. See data/common.yaml for proper hieara
# configuration parameters name:
# * bdii::"name" for BDII class
# * bdii::sitebdii::"name" for Site-BDII class
# * bdii::topbdii::"name" for Top-BDII class
class bdii::params {
  $log_level            = lookup('bdii::params::log_level', undef, undef, 'ERROR')
  $port                 = lookup('bdii::params::port', undef, undef, 2170)
  $user                 = lookup('bdii::params::user', undef, undef, 'ldap')
  $slapdconf            = lookup('bdii::params::slapdconf', undef, undef, '/etc/bdii/bdii-slapd.conf')
  $selinux              = lookup('bdii::params::selinux', undef, undef, false)
  $bdiipasswd           = lookup('bdii::params::bdiipasswd', undef, undef, randompass())
  $bdiihost             = lookup('bdii::params::bdiihost', undef, undef, 'somehost.example.com')
  $deletedelay          = lookup('bdii::params::deletedelay', undef, undef, 0)
  $slapdthreads         = lookup('bdii::params::slapdthreads', undef, undef, 16)
  $slapdloglevel        = lookup('bdii::params::slapdloglevel', undef, undef, 0)
  # site specific stuff:
  $siteurls             = lookup('bdii::params::siteurls', undef, undef, '# DUMMY  ldap://localhost:2170/mds-vo-name=resource,o=grid')
  $sitename             = lookup('bdii::params::sitename', undef, undef, 'somesite')
  $sitebdiihost         = lookup('bdii::params::sitebdiihost', undef, undef, 'somehost.example.com')
  $sitedesc             = lookup('bdii::params::sitedesc', undef, undef, 'somesite descr')
  $siteweb              = lookup('bdii::params::siteweb', undef, undef, 'www.somesite.example.com')
  $sitedistributed      = lookup('bdii::params::sitedistributed', undef, undef, '')
  $siteloc              = lookup('bdii::params::siteloc', undef, undef, '')
  $sitecountry          = lookup('bdii::params::sitecountry', undef, undef, 'somecountry')
  $sitelat              = lookup('bdii::params::sitelat', undef, undef, '')
  $sitelong             = lookup('bdii::params::sitelong', undef, undef, '')
  $siteemail            = lookup('bdii::params::siteemail', undef, undef, '')
  $sitesecuritymail     = lookup('bdii::params::sitesecuritymail', undef, undef, '')
  $sitesupportemail     = lookup('bdii::params::sitesupportemail', undef, undef, '')
  $config               = lookup('bdii::params::config', undef, undef, 'puppet')
  $egeeroc              = lookup('bdii::params::egeeroc', undef, undef, '')
  $egeeservice          = lookup('bdii::params::egeeservice', undef, undef, 'prod')
  $grid                 = lookup('bdii::params::grid', undef, undef, '')
  $wlcgtier             = lookup('bdii::params::wlcgtier', undef, undef, '')
  $otherinfo            = lookup('bdii::params::otherinfo', undef, undef, []) #could be WLCG_PARENT=stuff
}
