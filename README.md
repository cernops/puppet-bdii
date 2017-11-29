puppet-bdii
===========

[![Build Status](https://travis-ci.org/cernops/puppet-bdii.png?branch=master)](https://travis-ci.org/cernops/puppet-bdii)
[![Code Coverage](https://coveralls.io/repos/github/cernops/puppet-bdii/badge.svg?branch=master)](https://coveralls.io/github/cernops/puppet-bdii)
[![Puppet Forge](https://img.shields.io/puppetforge/v/CERNOps/bdii.svg)](https://forge.puppetlabs.com/CERNOps/bdii)
[![Puppet Forge - downloads](https://img.shields.io/puppetforge/dt/CERNOps/bdii.svg)](https://forge.puppetlabs.com/CERNOps/bdii)
[![Puppet Forge - endorsement](https://img.shields.io/puppetforge/e/CERNOps/bdii.svg)](https://forge.puppetlabs.com/CERNOps/bdii)
[![Puppet Forge - scores](https://img.shields.io/puppetforge/f/CERNOps/bdii.svg)](https://forge.puppetlabs.com/CERNOps/bdii)

Synopsis
--------

Manage the BDII grid information system.

Documentation for BDII is available [here](http://gridinfo.web.cern.ch)

To use a bdii resource, it should be enough to simply:

include bdii

To manage site bdii, it is expected that hiera should be used to configure
the sitebdii parameters, however it is in theory possible to modify the 
defaults in params.pp if this is more convenient.
