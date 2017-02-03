class bdii::firewall {

  firewall { '101 allow bdii':
    proto  => 'tcp',
    dport  => '2170',
    action => 'accept',
  }

  firewall { '101 allow bdii ipv6':
    proto    => 'tcp',
    dport    => '2170',
    action   => 'accept',
    provider => 'ip6tables',
  }
}
