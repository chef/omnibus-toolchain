omnibus-toolchain CHANGELOG
==========================
This file is used to list changes made in each version of the omnibus-toolchain.

<!-- latest_release -->
<!-- latest_release -->

<!-- release_rollup -->
<!-- release_rollup -->

<!-- latest_stable_release -->
## [3.0.39](https://github.com/chef/omnibus-toolchain/tree/3.0.39) (2025-07-23)

#### Merged Pull Requests
- enalbing 2025, disabling 2012, 2012r2 [#297](https://github.com/chef/omnibus-toolchain/pull/297) ([sean-sype-simmons](https://github.com/sean-sype-simmons))
- Sean sype progress/chef 21530 platform support windows2025 omnibus [#299](https://github.com/chef/omnibus-toolchain/pull/299) ([sean-sype-simmons](https://github.com/sean-sype-simmons))
<!-- latest_stable_release -->

## [3.0.37](https://github.com/chef/omnibus-toolchain/tree/3.0.37) (2025-06-26)

#### Merged Pull Requests
- Add Support Ubuntu 24.04 [#296](https://github.com/chef/omnibus-toolchain/pull/296) ([poorndm](https://github.com/poorndm))

## [3.0.36](https://github.com/chef/omnibus-toolchain/tree/3.0.36) (2025-05-12)

#### Merged Pull Requests
- remove mac 11 as its EOL and update 12 as builder omniubs toolchain/muthuja [#292](https://github.com/chef/omnibus-toolchain/pull/292) ([muthuja](https://github.com/muthuja))
- adding darwin-20 and freebsd-13 x86_64 to the platform list [#293](https://github.com/chef/omnibus-toolchain/pull/293) ([muthuja](https://github.com/muthuja))
- Add support for Macos - 13 and 14 [#294](https://github.com/chef/omnibus-toolchain/pull/294) ([poorndm](https://github.com/poorndm))
- Bump bundler version [#295](https://github.com/chef/omnibus-toolchain/pull/295) ([jaymzh](https://github.com/jaymzh))

## [3.0.32](https://github.com/chef/omnibus-toolchain/tree/3.0.32) (2024-11-13)

#### Merged Pull Requests
- Update ruby - 3.1.6 [#290](https://github.com/chef/omnibus-toolchain/pull/290) ([poorndm](https://github.com/poorndm))

## [3.0.31](https://github.com/chef/omnibus-toolchain/tree/3.0.31) (2024-09-10)

#### Merged Pull Requests
- comment the omnibus-buildkite plugin version so that it will pick it automatically from expeditor [#287](https://github.com/chef/omnibus-toolchain/pull/287) ([muthuja](https://github.com/muthuja))
- remove el6 and update buildkite-plugin version [#288](https://github.com/chef/omnibus-toolchain/pull/288) ([muthuja](https://github.com/muthuja))

## [3.0.29](https://github.com/chef/omnibus-toolchain/tree/3.0.29) (2024-05-30)

#### Merged Pull Requests
- remove mac10.15 from pipeline and make mac 11 as builder [#283](https://github.com/chef/omnibus-toolchain/pull/283) ([muthuja](https://github.com/muthuja))

## [3.0.28](https://github.com/chef/omnibus-toolchain/tree/3.0.28) (2024-01-05)

#### Merged Pull Requests
- Support amazon2023  [#274](https://github.com/chef/omnibus-toolchain/pull/274) ([muthuja](https://github.com/muthuja))

## [3.0.27](https://github.com/chef/omnibus-toolchain/tree/3.0.27) (2023-12-06)

#### Merged Pull Requests
- Bump omnibus from `d6d4b0d` to `56015cb` [#248](https://github.com/chef/omnibus-toolchain/pull/248) ([dependabot[bot]](https://github.com/dependabot[bot]))
- Add Rocky-8 support - Angry omnibus-toolchain [#240](https://github.com/chef/omnibus-toolchain/pull/240) ([poorndm](https://github.com/poorndm))
- Support rocky-8 arm64 [#242](https://github.com/chef/omnibus-toolchain/pull/242) ([poorndm](https://github.com/poorndm))
- Adding rockylinux9 to omnibus-toolchain [#254](https://github.com/chef/omnibus-toolchain/pull/254) ([muthuja](https://github.com/muthuja))
- Adding rocky9 arm64 to omnibus-toolchain [#256](https://github.com/chef/omnibus-toolchain/pull/256) ([muthuja](https://github.com/muthuja))
- Unpin curl on solaris [#266](https://github.com/chef/omnibus-toolchain/pull/266) ([poorndm](https://github.com/poorndm))
- Unpin libxslt and libxml on windows [#263](https://github.com/chef/omnibus-toolchain/pull/263) ([poorndm](https://github.com/poorndm))
- Bump omnibus-software from `3268356` to `2a99879` [#268](https://github.com/chef/omnibus-toolchain/pull/268) ([dependabot[bot]](https://github.com/dependabot[bot]))
- Update to latest omnibus-software version [#270](https://github.com/chef/omnibus-toolchain/pull/270) ([poorndm](https://github.com/poorndm))
- Downgrade bash to fix solaris issue [#271](https://github.com/chef/omnibus-toolchain/pull/271) ([poorndm](https://github.com/poorndm))

## [3.0.17](https://github.com/chef/omnibus-toolchain/tree/3.0.17) (2023-08-24)

#### Merged Pull Requests
- Bump omnibus from `9c0643a` to `d6d4b0d` [#236](https://github.com/chef/omnibus-toolchain/pull/236) ([dependabot[bot]](https://github.com/dependabot[bot]))

## [3.0.16](https://github.com/chef/omnibus-toolchain/tree/3.0.16) (2023-08-16)

#### Merged Pull Requests
- Pin libtool for aix [#212](https://github.com/chef/omnibus-toolchain/pull/212) ([jeremiahsnapp](https://github.com/jeremiahsnapp))
- Update signing Identity  [#214](https://github.com/chef/omnibus-toolchain/pull/214) ([poorndm](https://github.com/poorndm))
- Lint ruby files using chefstyle on pull-requests [#216](https://github.com/chef/omnibus-toolchain/pull/216) ([gscho](https://github.com/gscho))
- Move verify pipeline [#217](https://github.com/chef/omnibus-toolchain/pull/217) ([gscho](https://github.com/gscho))
- update omnibus to use internal sources [#219](https://github.com/chef/omnibus-toolchain/pull/219) ([evanahlberg](https://github.com/evanahlberg))
- Fix build issues on Free bsd , solaris and AIX #1744 [#218](https://github.com/chef/omnibus-toolchain/pull/218) ([poorndm](https://github.com/poorndm))
- Fix build issue - Reverting the changes made PR - 219 [#220](https://github.com/chef/omnibus-toolchain/pull/220) ([poorndm](https://github.com/poorndm))
- Add rocky linux-8 [#221](https://github.com/chef/omnibus-toolchain/pull/221) ([poorndm](https://github.com/poorndm))
- renaming omnibus queue [#222](https://github.com/chef/omnibus-toolchain/pull/222) ([sean-simmons-progress](https://github.com/sean-simmons-progress))
- Removed support for el-6-i686 due to compatibility issues [#225](https://github.com/chef/omnibus-toolchain/pull/225) ([poorndm](https://github.com/poorndm))
- Enable auto trigger of omnibus/release pipeline - Revert PR 213 changes [#223](https://github.com/chef/omnibus-toolchain/pull/223) ([poorndm](https://github.com/poorndm))
- Fix Solaris Build Issue [#226](https://github.com/chef/omnibus-toolchain/pull/226) ([poorndm](https://github.com/poorndm))
- Sean simmons progress/chef 4580/aix artifactory2 [#229](https://github.com/chef/omnibus-toolchain/pull/229) ([sean-simmons-progress](https://github.com/sean-simmons-progress))
- Sean simmons progress/chef 4580/aix artifactory2 [#230](https://github.com/chef/omnibus-toolchain/pull/230) ([sean-simmons-progress](https://github.com/sean-simmons-progress))
- adding two more platforms [#231](https://github.com/chef/omnibus-toolchain/pull/231) ([sean-simmons-progress](https://github.com/sean-simmons-progress))
- Sean simmons progress/chef 4580/hotfix [#232](https://github.com/chef/omnibus-toolchain/pull/232) ([sean-simmons-progress](https://github.com/sean-simmons-progress))

## [3.0.0](https://github.com/chef/omnibus-toolchain/tree/3.0.0) (2022-05-30)

#### Merged Pull Requests
- Unpin ohai in omnibus Gemfile [#202](https://github.com/chef/omnibus-toolchain/pull/202) ([jeremiahsnapp](https://github.com/jeremiahsnapp))
- Update README.md [#203](https://github.com/chef/omnibus-toolchain/pull/203) ([tas50](https://github.com/tas50))
- Fix regressions [#204](https://github.com/chef/omnibus-toolchain/pull/204) ([jeremiahsnapp](https://github.com/jeremiahsnapp))
- Pin openssl to 1.1.1m [#205](https://github.com/chef/omnibus-toolchain/pull/205) ([jayashrig158](https://github.com/jayashrig158))
- Pin libxml2 and libxslt for windows [#207](https://github.com/chef/omnibus-toolchain/pull/207) ([jeremiahsnapp](https://github.com/jeremiahsnapp))
- IPACK-192 remove helper scripts [#208](https://github.com/chef/omnibus-toolchain/pull/208) ([jeremiahsnapp](https://github.com/jeremiahsnapp))
- IPACK-204 Prepare for new omnibus-toolchain build [#209](https://github.com/chef/omnibus-toolchain/pull/209) ([jeremiahsnapp](https://github.com/jeremiahsnapp))
- IPACK-204 use ruby 3.1, openssl 3 and UCRT64 [#210](https://github.com/chef/omnibus-toolchain/pull/210) ([jeremiahsnapp](https://github.com/jeremiahsnapp))

## [2.1.20](https://github.com/chef/omnibus-toolchain/tree/2.1.20) (2021-12-10)

#### Merged Pull Requests
- Remove expat pin [#185](https://github.com/chef/omnibus-toolchain/pull/185) ([mimaslanka](https://github.com/mimaslanka))
- Add ubuntu 1604 to build matrix [#188](https://github.com/chef/omnibus-toolchain/pull/188) ([jeremiahsnapp](https://github.com/jeremiahsnapp))
- Replace ubuntu 1604 aarch64 with x86_64 [#189](https://github.com/chef/omnibus-toolchain/pull/189) ([jeremiahsnapp](https://github.com/jeremiahsnapp))
- Bump openssl to version 1.1.1l [#191](https://github.com/chef/omnibus-toolchain/pull/191) ([jeremiahsnapp](https://github.com/jeremiahsnapp))
- Produce macOS 12 x86_64 packages [#194](https://github.com/chef/omnibus-toolchain/pull/194) ([tas50](https://github.com/tas50))
- Produce Windows 11 and 2022 packages [#195](https://github.com/chef/omnibus-toolchain/pull/195) ([tas50](https://github.com/tas50))
- Update Ruby from 2.7.4 to 2.7.5 [#193](https://github.com/chef/omnibus-toolchain/pull/193) ([tas50](https://github.com/tas50))
- Pin ohai to 16.17.0 [#192](https://github.com/chef/omnibus-toolchain/pull/192) ([jayashrig158](https://github.com/jayashrig158))
- Limit workers on AIX [#200](https://github.com/chef/omnibus-toolchain/pull/200) ([jeremiahsnapp](https://github.com/jeremiahsnapp))

## [2.1.11](https://github.com/chef/omnibus-toolchain/tree/2.1.11) (2021-07-16)

#### Merged Pull Requests
- Test bash command substitution [#181](https://github.com/chef/omnibus-toolchain/pull/181) ([jeremiahsnapp](https://github.com/jeremiahsnapp))
- Pin ncurses to 5.9 on Solaris [#182](https://github.com/chef/omnibus-toolchain/pull/182) ([jeremiahsnapp](https://github.com/jeremiahsnapp))

## [2.1.9](https://github.com/chef/omnibus-toolchain/tree/2.1.9) (2021-07-14)

#### Merged Pull Requests
- Remove support for Ubuntu 14.04 [#147](https://github.com/chef/omnibus-toolchain/pull/147) ([tas50](https://github.com/tas50))
- Enable FreeBSD12 [#151](https://github.com/chef/omnibus-toolchain/pull/151) ([jaymalasinha](https://github.com/jaymalasinha))
- Remove the old versions from the gtar def [#149](https://github.com/chef/omnibus-toolchain/pull/149) ([tas50](https://github.com/tas50))
- Update openssl to 1.1.1j and ruby to 2.7.2 to enable m1 mac builds [#153](https://github.com/chef/omnibus-toolchain/pull/153) ([jeremiahsnapp](https://github.com/jeremiahsnapp))
- Pin git for solaris [#168](https://github.com/chef/omnibus-toolchain/pull/168) ([jeremiahsnapp](https://github.com/jeremiahsnapp))
- Fix aix builds [#169](https://github.com/chef/omnibus-toolchain/pull/169) ([jeremiahsnapp](https://github.com/jeremiahsnapp))
- Add berkshelf to omnibus toolchain [#165](https://github.com/chef/omnibus-toolchain/pull/165) ([tas50](https://github.com/tas50))
- Add &quot;berks --version&quot; to omnibus-test.sh [#170](https://github.com/chef/omnibus-toolchain/pull/170) ([jeremiahsnapp](https://github.com/jeremiahsnapp))
- Fix path to berks in omnibus-test.sh [#175](https://github.com/chef/omnibus-toolchain/pull/175) ([jeremiahsnapp](https://github.com/jeremiahsnapp))
- Remove rubygems and bundler dependencies [#176](https://github.com/chef/omnibus-toolchain/pull/176) ([jeremiahsnapp](https://github.com/jeremiahsnapp))
- Stop building on EOL Ubuntu 16.04 [#173](https://github.com/chef/omnibus-toolchain/pull/173) ([tas50](https://github.com/tas50))
- Remove workaround for Solaris 10 / FreeBSD 9 [#172](https://github.com/chef/omnibus-toolchain/pull/172) ([tas50](https://github.com/tas50))
- Stop producing builds for Debian 8 [#160](https://github.com/chef/omnibus-toolchain/pull/160) ([tas50](https://github.com/tas50))
- Remove duplicate commented out apt in the berksfile [#161](https://github.com/chef/omnibus-toolchain/pull/161) ([tas50](https://github.com/tas50))
- Remove gtar check for &lt; 1.32 [#174](https://github.com/chef/omnibus-toolchain/pull/174) ([tas50](https://github.com/tas50))
- Update Ruby from 2.7.2 to 2.7.4 [#164](https://github.com/chef/omnibus-toolchain/pull/164) ([tas50](https://github.com/tas50))
- Remove the legacy maintainers file / task [#171](https://github.com/chef/omnibus-toolchain/pull/171) ([tas50](https://github.com/tas50))
- Build nokogiri later to optimize omnibus cache [#177](https://github.com/chef/omnibus-toolchain/pull/177) ([jeremiahsnapp](https://github.com/jeremiahsnapp))
- Only build berkshelf on specific platforms [#178](https://github.com/chef/omnibus-toolchain/pull/178) ([jeremiahsnapp](https://github.com/jeremiahsnapp))
- Fix bundler test on Windows [#179](https://github.com/chef/omnibus-toolchain/pull/179) ([jeremiahsnapp](https://github.com/jeremiahsnapp))

## [2.0.5](https://github.com/chef/omnibus-toolchain/tree/2.0.5) (2020-10-16)

#### Merged Pull Requests
- Enable macos-11.0 tester for omnibus-toolchain [#144](https://github.com/chef/omnibus-toolchain/pull/144) ([jaymalasinha](https://github.com/jaymalasinha))
- Enable support for Zlinux(s390x) RHEL8 and SLES15 [#145](https://github.com/chef/omnibus-toolchain/pull/145) ([jaymalasinha](https://github.com/jaymalasinha))
- Disable freebsd-12 until gtar and tar commands are fixed [#146](https://github.com/chef/omnibus-toolchain/pull/146) ([jaymalasinha](https://github.com/jaymalasinha))

## [2.0.2](https://github.com/chef/omnibus-toolchain/tree/2.0.2) (2020-05-11)

#### Merged Pull Requests
- Add Debian 10 aarch64 to build/test map [#142](https://github.com/chef/omnibus-toolchain/pull/142) ([christopher-snapp](https://github.com/christopher-snapp))

## [2.0.1](https://github.com/chef/omnibus-toolchain/tree/2.0.1) (2020-05-05)

#### Merged Pull Requests
- Remove msys2core as we now install msys2 in Windows image [#138](https://github.com/chef/omnibus-toolchain/pull/138) ([jaymalasinha](https://github.com/jaymalasinha))
- Fix expeditor config [#140](https://github.com/chef/omnibus-toolchain/pull/140) ([jaymalasinha](https://github.com/jaymalasinha))
- Remove stale symlinks [#141](https://github.com/chef/omnibus-toolchain/pull/141) ([jaymalasinha](https://github.com/jaymalasinha))

## [1.1.119](https://github.com/chef/omnibus-toolchain/tree/1.1.119) (2020-04-22)

#### Merged Pull Requests
- Add platforms and omnibus-test improvements [#136](https://github.com/chef/omnibus-toolchain/pull/136) ([jeremiahsnapp](https://github.com/jeremiahsnapp))

## [1.1.118](https://github.com/chef/omnibus-toolchain/tree/1.1.118) (2020-04-16)

#### Merged Pull Requests
- Install unix/linux tools required to build chef-workstation [#135](https://github.com/chef/omnibus-toolchain/pull/135) ([jaymalasinha](https://github.com/jaymalasinha))

## [1.1.117](https://github.com/chef/omnibus-toolchain/tree/1.1.117) (2020-04-01)

#### Merged Pull Requests
- Remove myself as maintainer [#127](https://github.com/chef/omnibus-toolchain/pull/127) ([scotthain](https://github.com/scotthain))
- Release toolchain with bundler 1.x and 2.x [#134](https://github.com/chef/omnibus-toolchain/pull/134) ([jaymalasinha](https://github.com/jaymalasinha))

## [1.1.115](https://github.com/chef/omnibus-toolchain/tree/1.1.115) (2020-02-26)

#### Merged Pull Requests
- Change subscription to omnibus-software to trigger correct pipeline [#121](https://github.com/chef/omnibus-toolchain/pull/121) ([scotthain](https://github.com/scotthain))
- Jsinha/add rhel8 [#122](https://github.com/chef/omnibus-toolchain/pull/122) ([jaymalasinha](https://github.com/jaymalasinha))
- Jsinha/update os [#126](https://github.com/chef/omnibus-toolchain/pull/126) ([jaymalasinha](https://github.com/jaymalasinha))
- Remove support for RHEL 6 s390x (zLinux) [#128](https://github.com/chef/omnibus-toolchain/pull/128) ([jaymalasinha](https://github.com/jaymalasinha))
- Update Software Cert for macOS signing &amp; add Debian 10 testers [#129](https://github.com/chef/omnibus-toolchain/pull/129) ([jaymalasinha](https://github.com/jaymalasinha))
- Jsinha/fix notarization [#130](https://github.com/chef/omnibus-toolchain/pull/130) ([jaymalasinha](https://github.com/jaymalasinha))

## [1.1.109](https://github.com/chef/omnibus-toolchain/tree/1.1.109) (2019-06-24)

#### Merged Pull Requests
- Fixes for omnibus buildkite pipeline [#119](https://github.com/chef/omnibus-toolchain/pull/119) ([jeremiahsnapp](https://github.com/jeremiahsnapp))

## [1.1.108](https://github.com/chef/omnibus-toolchain/tree/1.1.108) (2019-06-22)

#### Merged Pull Requests
- Make Ubuntu 14.04 use tar 1.28 [#117](https://github.com/chef/omnibus-toolchain/pull/117) ([jeremiahsnapp](https://github.com/jeremiahsnapp))

## [1.1.107](https://github.com/chef/omnibus-toolchain/tree/1.1.107) (2019-06-21)

#### Merged Pull Requests
- Add AIX specific paths to load-omnibus-toolchain [#116](https://github.com/chef/omnibus-toolchain/pull/116) ([jeremiahsnapp](https://github.com/jeremiahsnapp))

## [1.1.106](https://github.com/chef/omnibus-toolchain/tree/1.1.106) (2019-06-20)

#### Merged Pull Requests
- Pin tar to 1.28 for Ubuntu 14.04 [#115](https://github.com/chef/omnibus-toolchain/pull/115) ([jeremiahsnapp](https://github.com/jeremiahsnapp))

## [1.1.105](https://github.com/chef/omnibus-toolchain/tree/1.1.105) (2019-06-19)

#### Merged Pull Requests
- Fix install-omnibus-product.ps1 [#114](https://github.com/chef/omnibus-toolchain/pull/114) ([jeremiahsnapp](https://github.com/jeremiahsnapp))

## [1.1.104](https://github.com/chef/omnibus-toolchain/tree/1.1.104) (2019-06-19)

#### Merged Pull Requests
- Use product_name variable instead of just product [#113](https://github.com/chef/omnibus-toolchain/pull/113) ([jeremiahsnapp](https://github.com/jeremiahsnapp))

## [1.1.103](https://github.com/chef/omnibus-toolchain/tree/1.1.103) (2019-06-19)

#### Merged Pull Requests
- Use full path when calling mixlib-install [#111](https://github.com/chef/omnibus-toolchain/pull/111) ([jeremiahsnapp](https://github.com/jeremiahsnapp))

## [1.1.102](https://github.com/chef/omnibus-toolchain/tree/1.1.102) (2019-06-18)

#### Merged Pull Requests
- Update this repo to comply with our OSS guidelines [#109](https://github.com/chef/omnibus-toolchain/pull/109) ([tas50](https://github.com/tas50))
- Use gtar 1.32 [#108](https://github.com/chef/omnibus-toolchain/pull/108) ([tas50](https://github.com/tas50))
- Add helper binaries used in our pipeline to the toolchain package [#110](https://github.com/chef/omnibus-toolchain/pull/110) ([tduffield](https://github.com/tduffield))

## [1.1.99](https://github.com/chef/omnibus-toolchain/tree/1.1.99) (2019-05-14)

#### Merged Pull Requests
- Update ruby and berkshelf versions [#107](https://github.com/chef/omnibus-toolchain/pull/107) ([jaymalasinha](https://github.com/jaymalasinha))

## [1.1.98](https://github.com/chef/omnibus-toolchain/tree/1.1.98) (2019-04-01)

#### Merged Pull Requests
- Update to Ruby 2.5.3 [#102](https://github.com/chef/omnibus-toolchain/pull/102) ([tas50](https://github.com/tas50))
- Rename the kitchen files and update platforms [#103](https://github.com/chef/omnibus-toolchain/pull/103) ([tas50](https://github.com/tas50))
- Build on Solaris 11.2 for SPARC [#104](https://github.com/chef/omnibus-toolchain/pull/104) ([jaymalasinha](https://github.com/jaymalasinha))
- Update ruby to 2.5.5 [#106](https://github.com/chef/omnibus-toolchain/pull/106) ([tas50](https://github.com/tas50))

## [1.1.94](https://github.com/chef/omnibus-toolchain/tree/1.1.94) (2019-01-15)

#### Merged Pull Requests
- Update toolchain version to include latest bundler gem [#101](https://github.com/chef/omnibus-toolchain/pull/101) ([jaymalasinha](https://github.com/jaymalasinha))

## [1.1.93](https://github.com/chef/omnibus-toolchain/tree/1.1.93) (2018-10-24)

#### Merged Pull Requests
- Fix msys installation getting hung issue [#97](https://github.com/chef/omnibus-toolchain/pull/97) ([jaymalasinha](https://github.com/jaymalasinha))
- Add windows cmake to toolchain [#98](https://github.com/chef/omnibus-toolchain/pull/98) ([jaymalasinha](https://github.com/jaymalasinha))
- Swap git:// clone to https:// for verify [#99](https://github.com/chef/omnibus-toolchain/pull/99) ([jaymalasinha](https://github.com/jaymalasinha))

## [1.1.90](https://github.com/chef/omnibus-toolchain/tree/1.1.90) (2018-06-20)

#### Merged Pull Requests
- Updating MSYS2 version, the exit 127 issue appears to be resolved now [#95](https://github.com/chef/omnibus-toolchain/pull/95) ([scotthain](https://github.com/scotthain))
- Update build record [#96](https://github.com/chef/omnibus-toolchain/pull/96) ([jaymalasinha](https://github.com/jaymalasinha))

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