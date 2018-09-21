omnibus-toolchain CHANGELOG
==========================
This file is used to list changes made in each version of the omnibus-toolchain.

<!-- latest_release 1.1.91 -->
## [1.1.91](https://github.com/chef/omnibus-toolchain/tree/1.1.91) (2018-09-21)

#### Merged Pull Requests
- Fix msys installation getting hung issue [#97](https://github.com/chef/omnibus-toolchain/pull/97) ([jaymalasinha](https://github.com/jaymalasinha))
<!-- latest_release -->

<!-- release_rollup since=1.1.90 -->
### Changes since 1.1.90 release

#### Merged Pull Requests
- Fix msys installation getting hung issue [#97](https://github.com/chef/omnibus-toolchain/pull/97) ([jaymalasinha](https://github.com/jaymalasinha)) <!-- 1.1.91 -->
<!-- release_rollup -->

<!-- latest_stable_release -->
## [1.1.90](https://github.com/chef/omnibus-toolchain/tree/1.1.90) (2018-06-20)

#### Merged Pull Requests
- Updating MSYS2 version, the exit 127 issue appears to be resolved now [#95](https://github.com/chef/omnibus-toolchain/pull/95) ([scotthain](https://github.com/scotthain))
- Update build record [#96](https://github.com/chef/omnibus-toolchain/pull/96) ([jaymalasinha](https://github.com/jaymalasinha))
<!-- latest_stable_release -->

## [1.1.88](https://github.com/chef/omnibus-toolchain/tree/1.1.88) (2018-04-03)

#### Merged Pull Requests
- Update notification room [#87](https://github.com/chef/omnibus-toolchain/pull/87) ([scotthain](https://github.com/scotthain))
- A few documentation fixes to bring this up-to-date. [#89](https://github.com/chef/omnibus-toolchain/pull/89) ([juliandunn](https://github.com/juliandunn))
- Add a verification script so we don&#39;t have install-time failures [#90](https://github.com/chef/omnibus-toolchain/pull/90) ([scotthain](https://github.com/scotthain))
- update berkshelf, ruby, and other versions [#91](https://github.com/chef/omnibus-toolchain/pull/91) ([scotthain](https://github.com/scotthain))
- Fix tests up [#92](https://github.com/chef/omnibus-toolchain/pull/92) ([scotthain](https://github.com/scotthain))
- Fix tests some more [#93](https://github.com/chef/omnibus-toolchain/pull/93) ([scotthain](https://github.com/scotthain))

## [1.1.82](https://github.com/chef/omnibus-toolchain/tree/1.1.82) (2017-12-08)

#### Merged Pull Requests
- Unpin git version, add verification script, update gems [#83](https://github.com/chef/omnibus-toolchain/pull/83) ([scotthain](https://github.com/scotthain))
- Create symlinks for angry-omnibus-toolchain IPS package [#85](https://github.com/chef/omnibus-toolchain/pull/85) ([jaymalasinha](https://github.com/jaymalasinha))

## [1.1.80](https://github.com/chef/omnibus-toolchain/tree/1.1.80) (2017-12-01)

#### Merged Pull Requests
- Don&#39;t update pacman [#82](https://github.com/chef/omnibus-toolchain/pull/82) ([scotthain](https://github.com/scotthain))

## [1.1.79](https://github.com/chef/omnibus-toolchain/tree/1.1.79) (2017-11-28)

#### Merged Pull Requests
- Add expeditor subscription for omnibus-software merges [#79](https://github.com/chef/omnibus-toolchain/pull/79) ([jaymalasinha](https://github.com/jaymalasinha))
- Pin curl and rubygems [#81](https://github.com/chef/omnibus-toolchain/pull/81) ([scotthain](https://github.com/scotthain))

## [1.1.77](https://github.com/chef/omnibus-toolchain/tree/1.1.77) (2017-09-18)

#### Merged Pull Requests
- Update notification channels to #eng-services-notify [#74](https://github.com/chef/omnibus-toolchain/pull/74) ([schisamo](https://github.com/schisamo))
- Upgrade ruby 2.4.2 and remove rubygems version pin [#78](https://github.com/chef/omnibus-toolchain/pull/78) ([jaymalasinha](https://github.com/jaymalasinha))

## [1.1.76](https://github.com/chef/omnibus-toolchain/tree/1.1.76) (2017-08-15)

#### Merged Pull Requests
- Update Expeditor Config + Remove Build Cookbook [#71](https://github.com/chef/omnibus-toolchain/pull/71) ([tduffield](https://github.com/tduffield))
- Update versions to be more current and deal with git CVE [#72](https://github.com/chef/omnibus-toolchain/pull/72) ([scotthain](https://github.com/scotthain))



v1.1.11
------
- Fix symlinks from embedded/bin to bin

v1.1.10
------
- Update git to 2.8.2
- Update ruby to 2.2.5
- Remove fakeroot for all linux flavors (moving back to the omnibus cookbook)

v1.1.9
------
- Add gtar for all *nix flavors
- Update postinstall symlinks to point to /opt/omnibus-toolchain/bin

v1.1.8
------
- Add fakeroot for all linux flavors
- Update kitchen.yml for local testing

v1.1.7
------
- Update to Ruby 2.1.8.
- Add licensing information.

v1.1.6
------
- Update incorrect CHANGELOG.md message introduced in https://github.com/chef/omnibus-toolchain/commit/4b1fb9373ef534bb3ff2d325881cd5b069e2204c
- Update git version.

v1.1.5
------
- Regardless of the number, first official public release.