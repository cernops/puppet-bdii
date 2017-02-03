puppet-bdii
===========

Synopsis
--------

Manage the BDII grid information system.

Documentation for BDII is available [here](http://gridinfo.web.cern.ch)

To use a bdii resource, it should be enough to simply:

include bdii

To manage site bdii, it is expected that hiera should be used to configure
the sitebdii parameters, however it is in theory possible to modify the 
defaults in params.pp if this is more convenient.
