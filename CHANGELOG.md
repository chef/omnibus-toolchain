omnibus-toolchain CHANGELOG
==========================
This file is used to list changes made in each version of the omnibus-toolchain.

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