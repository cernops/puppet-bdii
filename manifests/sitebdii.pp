class bdii::sitebdii (
  # daemon configuration
  String $log_level               = bdii::sitebdii::params('log_level'),
  Stdlib::Port $port              = bdii::sitebdii::params('port'),
  String $user                    = bdii::sitebdii::params('user'),
  Stdlib::Absolutepath $slapdconf = bdii::sitebdii::params('slapdconf'),
  Boolean $selinux                = bdii::sitebdii::params('selinux'),
  Boolean $firewall               = bdii::sitebdii::params('firewall'),
  String $bdiipasswd              = bdii::sitebdii::params('bdiipasswd'),
  Integer $deletedelay            = bdii::sitebdii::params('deletedelay'),
  Integer $slapdthreads           = bdii::sitebdii::params('slapdthreads'),
  Integer $slapdloglevel          = bdii::sitebdii::params('slapdloglevel'),
  Optional[String] $ramsize       = bdii::sitebdii::params('ramsize'),
  # site specific stuff
  Stdlib::Host $bdiihost          = bdii::sitebdii::params('bdiihost'),
  String $sitename                = bdii::sitebdii::params('sitename'),
  Array[String] $siteurls         = bdii::sitebdii::params('siteurls'),
  Stdlib::Host $sitebdiihost      = bdii::sitebdii::params('sitebdiihost'),
  String $sitedesc                = bdii::sitebdii::params('sitedesc'),
  String $siteweb                 = bdii::sitebdii::params('siteweb'),
  String $sitedistributed         = bdii::sitebdii::params('sitedistributed'),
  String $siteloc                 = bdii::sitebdii::params('siteloc'),
  String $sitecountry             = bdii::sitebdii::params('sitecountry'),
  String $sitelat                 = bdii::sitebdii::params('sitelat'),
  String $sitelong                = bdii::sitebdii::params('sitelong'),
  String $siteemail               = bdii::sitebdii::params('siteemail'),
  String $sitesecuritymail        = bdii::sitebdii::params('sitesecuritymail'),
  String $sitesupportemail        = bdii::sitebdii::params('sitesupportemail'),
  String $config                  = bdii::sitebdii::params('config'),
  String $egeeroc                 = bdii::sitebdii::params('egeeroc'),
  String $egeeservice             = bdii::sitebdii::params('egeeservice'),
  Array[String] $grid             = bdii::sitebdii::params('grid'),
  Optional[String] $wlcgtier      = bdii::sitebdii::params('wlcgtier'),
  Array[String] $otherinfo        = bdii::sitebdii::params('otherinfo'),
  # templates
  String $template_config         = bdii::sitebdii::params('template_config'),
  String $template_slapd          = bdii::sitebdii::params('template_slapd'),
  String $template_sysconfig      = bdii::sitebdii::params('template_sysconfig'),
  String $template_glite          = bdii::sitebdii::params('template_glite'),
  String $template_site           = bdii::sitebdii::params('template_site'),
  String $template_site_urls      = bdii::sitebdii::params('template_site_urls'),
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
  file { '/etc/bdii/gip/glite-info-site-defaults.conf':
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


# extract parameter from hiera configuration and prefer bdii::params::
# to ensure compatibility with older version of puppet BDII module
function bdii::sitebdii::params(String $name) {
  lookup({
    'name' => "bdii::${name}",
    'default_value' => getvar("bdii::params::${name}"),
  })
}
