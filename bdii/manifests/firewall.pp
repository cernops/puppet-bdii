class bdii::firewall {

  firewall { '101 allow bdii':
    proto  => 'tcp',
    dport  => '2170',
    action => 'accept',
  }
}
