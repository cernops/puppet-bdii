class bdii (
  # daemon configuration
  $log_level            = $bdii::params::log_level,
  $port                 = $bdii::params::port,
  $user                 = $bdii::params::user,
  $slapdconf            = $bdii::params::slapdconf,
  $selinux              = $bdii::params::selinux,
  $firewall             = $bdii::params::firewall,
  $bdiipasswd           = $bdii::params::bdiipasswd,
  $deletedelay          = $bdii::params::deletedelay,
  $slapdthreads         = $bdii::params::slapdthreads,
  $slapdloglevel        = $bdii::params::slapdloglevel,
  $ramsize              = $bdii::params::ramsize,
  # site specific stuff
  $bdiihost             = $bdii::params::bdiihost,
  $sitename             = $bdii::params::sitename,
  $siteurls             = $bdii::params::siteurls,
  $sitebdiihost         = $bdii::params::sitebdiihost,
  $sitedesc             = $bdii::params::sitedesc,
  $siteweb              = $bdii::params::siteweb,
  $sitedistributed      = $bdii::params::sitedistributed,
  $siteloc              = $bdii::params::siteloc,
  $sitecountry          = $bdii::params::sitecountry,
  $sitelat              = $bdii::params::sitelat,
  $sitelong             = $bdii::params::sitelong,
  $siteemail            = $bdii::params::siteemail,
  $sitesecuritymail     = $bdii::params::sitesecuritymail,
  $sitesupportemail     = $bdii::params::sitesupportemail,
  $config               = $bdii::params::config,
  $egeeroc              = $bdii::params::egeeroc,
  $egeeservice          = $bdii::params::egeeservice,
  $grid                 = $bdii::params::grid,
  $wlcgtier             = $bdii::params::wlcgtier,
  $otherinfo            = $bdii::params::otherinfo,
  # templates
  $template_config      = $bdii::params::template_config,
  $template_slapd       = $bdii::params::template_slapd,
  $template_sysconfig   = $bdii::params::template_sysconfig,
  $template_glite       = $bdii::params::template_glite,
  $template_site        = $bdii::params::template_site,
  $template_site_urls   = $bdii::params::template_site_urls,
) inherits ::bdii::params {

  include ::bdii::install
  include ::bdii::service
  if $firewall {
    include ::bdii::firewall
  }
  include ::bdii::config

}
