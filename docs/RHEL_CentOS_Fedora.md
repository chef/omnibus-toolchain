Installing the Base Omnibus Toolchain on Red Hat Enterprise Linux/CentOS/Fedora
==================

Since RHEL/CentOS/Fedora is a GNU based toolchain, installing the pre-requisites is somewhat easy. This procedure has been tested on the following platforms: i686, x86_64, ppc64, ppc64le and aarch64. Other platforms may work, if they do a PR would be greatly appreciated to include the known platform in the docs and any other changes that may be necessary.

Login as the root user and perform the following instructions.

Install a build toolchain for the platform as specified by the [build-essential cookbook](https://github.com/chef-cookbooks/build-essential/blob/master/resources/build_essential.rb)

```
yum install -y autoconf bison flex gcc gcc-c++ gettext kernel-devel make m4 ncurses-devel patch
```

Install git

```
yum install -y git
```

Install the rpm-build package so omnibus will be able to build rpm packages.

```
yum install -y rpm-build
```

Install packages used when compiling ruby as [specified by the ruby-install tool](https://github.com/postmodern/ruby-install/blob/master/share/ruby-install/ruby/dependencies.txt)

```
yum install -y gcc automake bison zlib-devel libyaml-devel openssl-devel gdbm-devel readline-devel ncurses-devel libffi-devel
```

[Download](https://www.ruby-lang.org/en/downloads/) and [install ruby source code](https://www.ruby-lang.org/en/documentation/installation/#building-from-source)

```
curl -L -o ruby-2.4.2.tar.gz https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.2.tar.gz
tar xzvf ruby-2.4.2.tar.gz
cd ruby-2.4.2
./configure
make
make install
cd -
```

Install bundler

```
gem install bundler
```

Create a non-root user to run the build

```
useradd builder
```

Create required directories with proper ownership

```
mkdir /var/cache/omnibus
chown builder:builder /var/cache/omnibus
mkdir /opt/omnibus-toolchain
chown builder:builder /opt/omnibus-toolchain
```

Switch to the non-root user

```
su - builder
```

Download and build omnibus-toolchain

```
git clone https://github.com/chef/omnibus-toolchain.git
cd omnibus-toolchain

# if a Gemfile.lock file already exists then run
bundle install --without development --deployment

# if a Gemfile.lock file does not already exist then run
bundle install --without development --path vendor/bundle

bundle exec omnibus build omnibus-toolchain
```

Once the build is finished the rpm and metadata files should be found in the ./pkg/ directory.

Common Problems
---------------

On some platforms, the ffi rubygem will fail to compile it's native extensions. Most distributions include a version of libffi which has support for your platform, which we install as part of the preconditions above. However, it may be too old for the ffi rubygem. If this is the case, the best course of action is to install the latest version of [libffi](https://sourceware.org/libffi/) attempt to compile it and install it as root. If it's installed and visible via pkg-config then the ffi rubygem will use that instead of the older native code included within it's codebase.
