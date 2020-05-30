class bdii (
  # daemon configuration
  String $log_level               = $bdii::params::log_level,
  Stdlib::Port $port              = $bdii::params::port,
  String $user                    = $bdii::params::user,
  Stdlib::Absolutepath $slapdconf = $bdii::params::slapdconf,
  Boolean $selinux                = $bdii::params::selinux,
  Boolean $firewall,
  String $bdiipasswd              = $bdii::params::bdiipasswd,
  Integer $deletedelay            = $bdii::params::deletedelay,
  Integer $slapdthreads           = $bdii::params::slapdthreads,
  Integer $slapdloglevel          = $bdii::params::slapdloglevel,
  Optional[String] $ramsize,
  # templates
  String $template_config,
  String $template_slapd,
  String $template_sysconfig,
) inherits ::bdii::params {

  contain ::bdii::install
  contain ::bdii::service
  if $firewall {
    contain ::bdii::firewall
    Class['::bdii::firewall'] -> Class['::bdii::config']
  }
  contain ::bdii::config

  Class['::bdii::install']
  -> Class['::bdii::config']
  ~> Class['::bdii::service']

}
