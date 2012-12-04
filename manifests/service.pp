class bdii::service {
     service { "bdii":
              ensure     => running,
              enable     => true,
              hasstatus  => true,
              hasrestart => true,
	      require    => Class["bdii::config"],
      }
}     
