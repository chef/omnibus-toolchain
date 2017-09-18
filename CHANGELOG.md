omnibus-toolchain CHANGELOG
==========================
This file is used to list changes made in each version of the omnibus-toolchain.

<!-- latest_release -->
<!-- latest_release -->

<!-- release_rollup -->
<!-- release_rollup -->

<!-- latest_stable_release -->
## [1.1.77](https://github.com/chef/omnibus-toolchain/tree/1.1.77) (2017-09-18)

#### Merged Pull Requests
- Update notification channels to #eng-services-notify [#74](https://github.com/chef/omnibus-toolchain/pull/74) ([schisamo](https://github.com/schisamo))
- Upgrade ruby 2.4.2 and remove rubygems version pin [#78](https://github.com/chef/omnibus-toolchain/pull/78) ([jaymalasinha](https://github.com/jaymalasinha))
<!-- latest_stable_release -->

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