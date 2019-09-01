# Changelog

## [v1.3.0] 1 September 2019 - Petr Vokac <petr.vokac@cern.ch>
- new templates and configuration parameters
- allow to configure Top/Site BDII with hierra

## [v1.2.2] 31 August 2018 - Steve Traylen <steve.traylen@cern.ch>
- Empty release for build problem

## [v1.2.1] 31 August 2018 - Steve Traylen <steve.traylen@cern.ch>
- Empty release for build problem

## [v1.2.0] 31 August 2018 - Steve Traylen <steve.traylen@cern.ch>

- Setting hiera variables `bdii::params::<parameter> is now considered deprecated
  though they do still work currently.
  Switch all settings to class paramameters or `bdii::<paramater>` or 
  `bdii::sitebdii::<parameter>` for instance.

## [v1.1.0] 30 August 2018 - Steve Traylen <steve.traylen@cern.ch>

- The firewall configuration can now be disabled, default it is 
  still enabled.
- syntax fixes.

## [v1.0.0] 24 November 2017 - Steve Traylen <steve.traylen@cern.ch>

- Bump release to 1.0.0 as drop for for puppet 3.

## [v0.2.2] 23 November 2017

- First P4 release

## 2017-02-07 Lorena Lobato Pardavila <lorena.lobato@cern.ch>

- BDII module adapted to puppet4

## 2014-09-19 Ben jones <ben.jones@cern.ch>

- Allow configuration of variables such as loglevel in sub bddi classes

## 2012-11-06 Ulrich Schwickerath <ulrich.schwickerath@cern.ch>

- First Release

