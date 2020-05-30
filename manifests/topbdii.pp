class bdii::topbdii (
  # daemon configuration
  String $log_level               = bdii::topbdii::params('log_level'),
  Stdlib::Port $port              = bdii::topbdii::params('port'),
  String $user                    = bdii::topbdii::params('user'),
  Stdlib::Absolutepath $slapdconf = bdii::topbdii::params('slapdconf'),
  Boolean $selinux                = bdii::topbdii::params('selinux'),
  Boolean $firewall               = bdii::topbdii::params('firewall'),
  String $bdiipasswd              = bdii::topbdii::params('bdiipasswd'),
  Integer $deletedelay            = bdii::topbdii::params('deletedelay'),
  Integer $slapdthreads           = bdii::topbdii::params('slapdthreads'),
  Integer $slapdloglevel          = bdii::topbdii::params('slapdloglevel'),
  Optional[String] $ramsize       = bdii::topbdii::params('ramsize'),
  # site specific stuff
  Stdlib::Host $bdiihost          = bdii::topbdii::params('bdiihost'),
  String $sitename                = bdii::topbdii::params('sitename'),
  # templates
  String $template_config         = bdii::topbdii::params('template_config'),
  String $template_slapd          = bdii::topbdii::params('template_slapd'),
  String $template_sysconfig      = bdii::topbdii::params('template_sysconfig'),
  String $template_glite          = bdii::topbdii::params('template_glite'),
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

  Class['bdii::config'] -> Class['bdii::topbdii']

  package { 'emi-bdii-top':
    ensure   => 'present',
  }

  file {'/etc/bdii/gip/glite-info-site-defaults.conf':
    content => template($template_glite),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    notify  => Class['bdii::service'],
  }
}


# extract parameter from hiera configuration and prefer bdii::params::
# to ensure compatibility with older version of puppet BDII module
function bdii::topbdii::params(String $name) {
  lookup({
    'name' => "bdii::${name}",
    'default_value' => getvar("bdii::params::${name}"),
  })
}
