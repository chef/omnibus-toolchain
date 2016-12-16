![Omnibus Toolchain Logo](resources/README-logo.png)   Omnibus Toolchain
============================
Omnibus Toolchain creates a native platform package that contains the entire required toolchain used for building [Omnibus](https://github.com/chef/omnibus) projects created by Chef Software, Inc. It may work with other projects, but that is not guaranteed.

Currently it supports the following operating systems:
* Solaris 10 (SPARC and x86)
* AIX 6 (POWER6 and later)
* Debian Linux (and derivatives like Ubuntu and Mint) on a variety of platforms (arm64 armhf ppc ppc64le x86 amd64)
* RHEL/CentOS/Fedora Linux on a variety of platforms (ppc64 ppc64le i686 x86_64)
* Mac OS X 10.9+
* FreeBSD 9, 10
* Windows 2012R2

Why?
----
Converge time when creating omnibus builders using the [omnibus cookbook](https://github.com/chef-cookbooks/omnibus) is relatively long and not conducive to speedy development cycles.

Prerequisites & Installation
----
This assumes that you have a sane build toolchain (gcc, make, etc) already installed on the machine, via the native operating system's package manager, or built from source on non-GNU based platforms (Solaris, AIX). If your platform is already supported by chef, you can use the [build-essential cookbook](https://github.com/chef-cookbooks/build-essential). Otherwise, the required tools are spelled out in the docs folder on a per OS basis and can be used as guidance for porting to a new OS/Platform.

For best results: multiple cores and at least 10GB of RAM (at least two of which are physical, the rest can be swap) are recommended. This process does a lot of compiling and will be very wall clock and system time consuming.

*NOTICE:* Cross-compiling is not supported. Omnibus toolchain requires your environment to "appear" native to what you want packages produced for. This means that running in an emulated (VirtualBox, QEMU, etc) environment works, but a cross-compile environment does not.

Installation
------------

Check out the [docs folder](https://github.com/chef/omnibus-toolchain/tree/master/docs) for the specific steps to build and install on your operating system distribution. Platform specific notes are included in the operating system distribution documentation if they are required.


Usage
-----
### Build

Once the inital toolchain is installed (see Installation) you can build this project using the following commands:

```shell
$ export PATH=/opt/omnibus-toolchain/embedded/bin:$PATH
$ bundle install --without development
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

Why so angry?
-----

Astute observers will notice there is an 'angry-omnibus-toolchain' definition. This is a software def that allows you to build the omnibus-toolchain in place using the omnibus-toolchain. Since the namespace is the same, a separate package is used for the purpose of CI.

License
-------
```text
Copyright 2015-2016 Chef Software, Inc.

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
