class bdii::sitebdii (
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
  $ramsize              = $bdii::params::ramsize_sitebdii,
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
  $template_sysconfig   = $bdii::params::template_sysconfig,
  $template_slapd       = $bdii::params::template_slapd,
  $template_glite       = $bdii::params::template_glite_sitebdii,
  $template_site        = $bdii::params::template_site,
  $template_site_urls   = $bdii::params::template_site_urls,
) inherits ::bdii::params {

  class { '::bdii':
    log_level           => $log_level,
    port                => $port,
    user                => $user,
    slapdconf           => $slapdconf,
    selinux             => $selinux,
    firewall            => $firewall,
    bdiipasswd          => $bdiipasswd,
    deletedelay         => $deletedelay,
    slapdthreads        => $slapdthreads,
    slapdloglevel       => $slapdloglevel,
    ramsize             => $ramsize,
    bdiihost            => $bdiihost,
    sitename            => $sitename,
    siteurls            => $siteurls,
    sitebdiihost        => $sitebdiihost,
    sitedesc            => $sitedesc,
    siteweb             => $siteweb,
    sitedistributed     => $sitedistributed,
    siteloc             => $siteloc,
    sitecountry         => $sitecountry,
    sitelat             => $sitelat,
    sitelong            => $sitelong,
    siteemail           => $siteemail,
    sitesecuritymail    => $sitesecuritymail,
    sitesupportemail    => $sitesupportemail,
    config              => $config,
    egeeroc             => $egeeroc,
    egeeservice         => $egeeservice,
    grid                => $grid,
    wlcgtier            => $wlcgtier,
    otherinfo           => $otherinfo,
    template_config     => $template_config,
    template_sysconfig  => $template_sysconfig,
    template_slapd      => $template_slapd,
    template_glite      => $template_glite,
    template_site       => $template_site,
    template_site_urls  => $template_site_urls,
  }

  Class['bdii::config'] -> Class['bdii::sitebdii']

  package { 'emi-bdii-site':
          ensure => 'present',
      }

  file {'/etc/glite-info-static/site/site.cfg':
      content => template($template_site),
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
  }
  file {'/etc/bdii/gip/glite-info-site-defaults.conf':
      content => template($template_glite),
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
  }

  file {'/etc/bdii/gip/site-urls.conf':
      content => template($template_site_urls),
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
  }
}
