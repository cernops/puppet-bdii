class bdii::params {
 
  $log_level   = hiera("log_level","DEBUG")
  $port        = hiera("port","2170")
  $user        = hiera("user","ldap")
  $slapdconf   = hiera("slapdconf","/etc/bdii/bdii-slapd.conf")
  $selinux     = hiera("selinux",true)
  $bdiipasswd  = hiera("bdii_passwd",randompass())


  # site specific stuff:
  $siteurls              =  hiera("siteurls","# DUMMY  ldap://localhost:2170/mds-vo-name=resource,o=grid")
  $sitename              =  hiera("sitename")      
  $sitebdiihost          =  hiera("sitebdiihost") 
  $sitedesc              =  hiera("sitedesc") 
  $siteweb               =  hiera("siteweb") 
  $sitedistributed       =  hiera("sitedistributed") 
  $siteloc               =  hiera("siteloc") 
  $sitecountry           =  hiera("sitecountry") 
  $sitelat               =  hiera("sitelat") 
  $sitelong              =  hiera("sitelong") 
  $siteemail             =  hiera("siteemail") 
  $sitesecuritymail      =  hiera("sitesecuritymail") 
  $sitesupportemail      =  hiera("sitesupportemail") 
  $config                =  hiera("config","puppet")
  $egeeroc               =  hiera("egeeroc")
  $egeeservice           =  hiera("egeeservice","prod")
  $grid                  =  hiera("grid")
  $wlcgtier              =  hiera("wlcgtier")

}
