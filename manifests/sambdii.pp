class bdii::sambdii (
  # daemon configuration
  String $log_level               = bdii::sambdii::params('log_level'),
  Stdlib::Port $port              = bdii::sambdii::params('port'),
  String $user                    = bdii::sambdii::params('user'),
  Stdlib::Absolutepath $slapdconf = bdii::sambdii::params('slapdconf'),
  Boolean $selinux                = bdii::sambdii::params('selinux'),
  Boolean $firewall               = bdii::sambdii::params('firewall'),
  String $bdiipasswd              = bdii::sambdii::params('bdiipasswd'),
  Integer $deletedelay            = bdii::sambdii::params('deletedelay'),
  Integer $slapdthreads           = bdii::sambdii::params('slapdthreads'),
  Integer $slapdloglevel          = bdii::sambdii::params('slapdloglevel'),
  Optional[String] $ramsize       = bdii::sambdii::params('ramsize'),
  # site specific stuff
  Stdlib::Host $bdiihost          = bdii::sambdii::params('bdiihost'),
  String $sitename                = bdii::sambdii::params('sitename'),
  # templates
  String $template_config         = bdii::sambdii::params('template_config'),
  String $template_slapd          = bdii::sambdii::params('template_slapd'),
  String $template_sysconfig      = bdii::sambdii::params('template_sysconfig'),
  String $template_glite          = bdii::sambdii::params('template_glite'),
) inherits ::bdii::params {

  class { '::bdii':
    log_level          => $log_level,
    port               => $port,
    user               => $user,
    slapdconf          => $slapdconf,
    selinux            => $selinux,
    firewall           => $firewall,
    bdiipasswd         => $bdiipasswd,
    deletedelay        => $deletedelay,
    slapdthreads       => $slapdthreads,
    slapdloglevel      => $slapdloglevel,
    ramsize            => $ramsize,
    template_config    => $template_config,
    template_slapd     => $template_slapd,
    template_sysconfig => $template_sysconfig,
  }

  Class['bdii::config'] -> Class['bdii::sambdii']

  package { 'emi-bdii-top':
    ensure => present,
  }

  file {'/etc/bdii/gip/glite-info-site-defaults.conf':
    content => template($template_glite),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }
}


# extract parameter from hiera configuration and prefer bdii::params::
# to ensure compatibility with older version of puppet BDII module
function bdii::sambdii::params(String $name) {
  lookup({
    'name' => "bdii::${name}",
    'default_value' => getvar("bdii::params::${name}"),
  })
}
