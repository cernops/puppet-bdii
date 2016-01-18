class bdii {

 case $::operatingsystem {
    'RedHat','SLC','SL','Scientific','CentOS':   {
         include bdii::install
         include bdii::service
         include bdii::firewall
         include bdii::config
    }
   default: {
              # There is some fedora configuration present but I can't actually get it to work.
    }
 }
}

  
  
