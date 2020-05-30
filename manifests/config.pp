class bdii::config (
  # daemon configuration
  String $log_level               = $::bdii::log_level,
  Stdlib::Port $port              = $::bdii::port,
  String $user                    = $::bdii::user,
  Stdlib::Absolutepath $slapdconf = $::bdii::slapdconf,
  Boolean $selinux                = $::bdii::selinux,
  Boolean $firewall               = $::bdii::firewall,
  String $bdiipasswd              = $::bdii::bdiipasswd,
  Integer $deletedelay            = $::bdii::deletedelay,
  Integer $slapdthreads           = $::bdii::slapdthreads,
  Integer $slapdloglevel          = $::bdii::slapdloglevel,
  Optional[String] $ramsize       = $::bdii::ramsize,
  # templates
  String $template_config         = $::bdii::template_config,
  String $template_slapd          = $::bdii::template_slapd,
  String $template_sysconfig      = $::bdii::template_sysconfig,
) inherits ::bdii {

  file { $slapdconf:
    content => template($template_slapd),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    notify  => Class['bdii::service'],
  }

  file { '/etc/bdii/bdii.conf':
    content => template($template_config),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    notify  => Class['bdii::service'],
  }

  file { '/etc/bdii/gip':
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

  file { '/var/lib/bdii/db':
    ensure => 'directory',
    owner  => 'ldap',
    group  => 'ldap',
    mode   => '0755',
  }

  file { '/etc/sysconfig/bdii':
    content => template($template_sysconfig),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    notify  => Class['bdii::service'],
  }
}
