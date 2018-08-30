class bdii (
  $manage_firewall = true,
) {

  case $::operatingsystem {
    'RedHat','SLC','SL','Scientific','CentOS':   {
      include ::bdii::install
      include ::bdii::service
      include ::bdii::config
      if ($manage_firewall) {
        include ::bdii::firewall
      }
  }
    default: {
              # There is some fedora configuration present but I can't actually get it to work.
    }
  }
}
