Installing the Base Omnibus Toolchain on Red Hat Enterprise Linux/CentOS/Fedora
==================

Since RHEL/CentOS/Fedora is a GNU based toolchain, installing the pre-requistes is somewhat easy. This procedure has been tested on the following platforms: i686, x86_64, ppc64, ppc64le. Other platforms may work, if they do a PR would be greatly appreciated to include the known platform in the docs and any other changes that may be necessary.

Preconditions/Assumptions
-------------------------

We assume you are starting the build process as an normal user but that you have sudo access. You can also run this procedure as root if you wish. Unfortunately, root access (via sudo or some other means) is required for the build to yield a successful toolchain.

We also assume you have Internet access via at least http and https. We'll be communicating with at least github and rubygems during this process, as well as your OS repositories.

You'll need the following packages:

```shell
sudo yum install autoconf bison flex gcc gcc-c++ kernel-devel \
make m4 patch gettext-devel ncurses-devel openssl-devel \
readline-devel zlib-devel git rpmdevtools libffi libffi-devel
```

You also need the "fakeroot" package to build the RPMs. This is available as part of the OS in some, but not all, releases (notable exceptions: RHEL/CentOS 7). The package is made of two parts: fakeroot and fakeroot-libs. I suggest checking with rpmfind.net for packages if you need them. Building from a SRPM is also possible, but all fakeroot SRPMs seem to have a build time dependency on sharutils which is not available by default in anything but Fedora. Fedora 23 binary RPMS for fakeroot and fakeroot-libs seem to work fine on RHEL/CentOS 7 based systems. Here are some pointers:
  * i686:
    * ftp://rpmfind.net/linux/fedora/linux/releases/23/Everything/i386/os/Packages/f/fakeroot-1.20.2-1.fc23.i686.rpm
    * ftp://rpmfind.net/linux/fedora/linux/releases/23/Everything/i386/os/Packages/f/fakeroot-libs-1.20.2-1.fc23.i686.rpm
  * x86_64:
    * ftp://rpmfind.net/linux/fedora/linux/releases/23/Everything/x86_64/os/Packages/f/fakeroot-1.20.2-1.fc23.x86_64.rpm
    * ftp://rpmfind.net/linux/fedora/linux/releases/23/Everything/x86_64/os/Packages/f/fakeroot-libs-1.20.2-1.fc23.x86_64.rpm
  * ppc64:
    *   ftp://rpmfind.net/linux/fedora-secondary/releases/23/Everything/ppc64/os/Packages/f/fakeroot-1.20.2-1.fc23.ppc64.rpm
    *  ftp://rpmfind.net/linux/fedora-secondary/releases/23/Everything/ppc64/os/Packages/f/fakeroot-libs-1.20.2-1.fc23.ppc64.rpm
  * ppc64le
    * ftp://rpmfind.net/linux/fedora-secondary/releases/23/Everything/ppc64le/os/Packages/f/fakeroot-1.20.2-1.fc23.ppc64le.rpm
    * ftp://rpmfind.net/linux/fedora-secondary/releases/23/Everything/ppc64le/os/Packages/f/fakeroot-libs-1.20.2-1.fc23.ppc64le.rpm

Ruby environment
----------------

Next, we need a temporary ruby environment. The omnibus software needs at least Ruby 2.1 in order to build correctly, but instead of depending on the OS version (since Ruby 2.1 is not available on all operating systems) we'll just build a temporary rbenv instead.

```shell
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
rbenv install 2.1.2
rbenv global 2.1.2
gem install bundler
```

Building the toolchain
----------------------

Now that all the pieces are in place, we can build the toolchain for real:

```shell
git clone https://github.com/chef/omnibus-toolchain.git
cd omnibus-toolchain
bundle install --without development
sudo ~/.rbenv/shims/bundle exec omnibus build omnibus-toolchain
```

That's it. At this point, the toolchain is installed in /opt/omnibus-toolchain and an RPM package for it is available in /var/cache/omnibus/pkg

Epilogue
--------

All changes made to your environment for the rbenv installation were temporary and can now be removed manually, or simply by logging out and then logging back into your shell account (or open a new terminal) at which point you can `rm -rf ~/.rbenv` to remove the temporary environment. The omnibus-toolchain includes a complete ruby.

Common Problems
---------------

On some platforms, the ffi rubygem will fail to compile it's native extensions. Most distributions include a version of libffi which has support for your platform, which we install as part of the preconditions above. However, it may be too old for the ffi rubygem. If this is the case, the best course of action is to install the latest version of [libffi](https://sourceware.org/libffi/) attempt to compile it and install it as root. If it's installed and visible via pkg-config then the ffi rubygem will use that instead of the older native code included within it's codebase.
