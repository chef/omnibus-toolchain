The Omnibus Toolchain project
============================
This project creates a package that contains the entire required development toolchain used for building omnibus projects.

Currently it supports the following operating systems:
* Solaris 10 (SPARC and x86)

Why?
----
![yodawg](http://bit.ly/1EyLstY)

Some operating systems don't have a package distribution mechanism such as 'yum' or 'apt' to make installation of development tools delightful. To work around this issue, we built this so we can build any omnibus project on Solaris 10 in a consistent manner.

Installation
------------
To build this from scratch please see the [Solaris 10 Toolchain Instructions](https://github.com/chef/omnibus-build-essential/blob/master/docs/solaris_toolchain_base.md) document.

Usage
-----
### Build

Once the inital toolchain is installed (see Installation) you can build this project using the following commands:

```shell
$ export PATH=/opt/be/embedded/bin:$PATH
$ bundle exec omnibus build build-essential
```

**Note - you may need to pass ```--with-cflags="-mcpu=v9"``` to the some of the gems to get ```bundle install``` to work on certain SPARC machines**

After the build completes packages will be available in the `pkg/` folder.

### Clean

You can clean up all temporary files generated during the build process with
the `clean` command:

```shell
$ bundle exec omnibus clean build-essential
```

Adding the `--purge` purge option removes __ALL__ files generated during the
build including the project install directory (`/opt/build-essential`) and
the package cache directory (`/var/cache/omnibus/pkg`):

```shell
$ bundle exec omnibus clean build-essential --purge
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
