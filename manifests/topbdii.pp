class bdii::topbdii (
  # daemon configuration
  $log_level            = $bdii::params::log_level,
  $port                 = $bdii::params::port,
  $user                 = $bdii::params::user,
  $slapdconf            = $bdii::params::slapdconf_topbdii,
  $selinux              = $bdii::params::selinux,
  $firewall             = $bdii::params::firewall,
  $bdiipasswd           = $bdii::params::bdiipasswd,
  $deletedelay          = $bdii::params::deletedelay_topbdii,
  $slapdthreads         = $bdii::params::slapdthreads_topbdii,
  $slapdloglevel        = $bdii::params::slapdloglevel,
  $ramsize              = $bdii::params::ramsize_topbdii,
  # site specific stuff
  $bdiihost             = $bdii::params::bdiihost,
  $sitebdiihost         = $bdii::params::sitebdiihost,
  $sitename             = $bdii::params::sitename,
  # templates
  $template_config      = $bdii::params::template_config,
  $template_sysconfig   = $bdii::params::template_sysconfig,
  $template_slapd       = $bdii::params::template_slapd_topbdii,
  $template_glite       = $bdii::params::template_glite,
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
    template_config     => $template_config,
    template_sysconfig  => $template_sysconfig,
    template_slapd      => $template_slapd,
    template_glite      => $template_glite,
  }

  Class['bdii::config'] -> Class['bdii::topbdii']

  package { 'emi-bdii-top':
          ensure => 'present',
      }

  file {'/etc/bdii/gip/glite-info-site-defaults.conf':
      content => template($template_glite),
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      notify   => Class['bdii::service'],
  }
}
