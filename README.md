The Omnibus Toolchain project
============================
This project creates a package that contains the entire required toolchain used for building omnibus projects.

Currently it supports the following operating systems:
* Solaris 10 (SPARC and x86)

Why?
----
Converge time when creating omnibus builders using the [omnibus cookbook](https://github.com/opscode-cookbooks/omnibus) is relatively long and not conducive to speedy development cycles.

Prerequisites
----
This assumes that you have a sane build toolchain (gcc, make, etc) already installed on the machine, via some mechanism. The recommended solution is using the [build-essential cookbook]() on platforms that support it.

Installation
------------
**NEEDS UPDATING**
To build this from scratch please see the [Solaris 10 Toolchain Instructions](https://github.com/chef/omnibus-toolchain/blob/master/docs/solaris_toolchain_base.md) document.


Usage
-----
### Build

Once the inital toolchain is installed (see Installation) you can build this project using the following commands:

```shell
$ export PATH=/opt/omnibus-toolchain/embedded/bin:$PATH
$ bundle install
$ bundle exec omnibus build omnibus-toolchain
```

After the build completes packages will be available in the `pkg/` folder.

### Clean

You can clean up all temporary files generated during the build process with
the `clean` command:

```shell
$ bundle exec omnibus clean omnibus-toolchain
```

Adding the `--purge` purge option removes __ALL__ files generated during the
build including the project install directory (`/opt/omnibus-toolchain`) and
the package cache directory (`/var/cache/omnibus/pkg`):

```shell
$ bundle exec omnibus clean omnibus-toolchain --purge
```

### Help

Full help for the Omnibus command line interface can be accessed with the
`help` command:

```shell
$ bundle exec omnibus help
```

Build Environment
-------------------------------

This has been tested with Virtualbox using a manual installation of Solaris 10u11-x86, then following the instructions in the Installation section. There currently is no support for building in a test-kitchen based environment.

Why so angry?
-----

Astute observers will notice there is an 'angry-omnibus-toolchain' definition. This is a software def that allows you to build the omnibus-toolchain in place using the omnibus-toolchain. Since the namespace is the same, a separate package is used for the purpose of CI.

License
-------
```text
Copyright 2015 Chef Software, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
