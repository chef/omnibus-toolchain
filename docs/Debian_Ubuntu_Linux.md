Installing the Base Omnibus Toolchain on Debian Linux or Ubuntu Linux
==================

Since Debian/Ubuntu/Mint is a GNU based toolchain, installing the pre-requistes is somewhat easy. This procedure has been tested on the following platforms: i386, x86_64, ppc, armhf, arm64. Other platforms may work, if they do a PR would be greatly appreciated to include the known platform in the docs and any other changes that may be necessary.

Preconditions/Assumptions
-------------------------

We assume you are starting the build process as an normal user but that you have sudo access. You can also run this procedure as root if you wish. Unfortunately, root access (via sudo or some other means) is required for the build to yield a successful toolchain.

We also assume you have Internet access via at least http and https. We'll be communicating with at least github and rubygems during this process, as well as your OS repositories.

You'll need the following packages:

```shell
sudo apt-get install autoconf bison build-essential \
flex gettext ncurses-dev libssl-dev libreadline-dev \
zlib1g-dev git libffi6 libffi-dev
```

Ruby environment
----------------

Next, we need a temporary ruby environment. The omnibus software needs at least Ruby 2.2 in order to build correctly, but instead of depending on the OS version (since Ruby 2.2 is not available on all operating systems) we'll just build a temporary rbenv instead.

```shell
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
export PATH="$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
rbenv install 2.2.3
rbenv global 2.2.3
gem install bundler
```

Building the toolchain
----------------------

Now that all the pieces are in place, we can build the toolchain for real:

```shell
git clone https://github.com/chef/omnibus-toolchain.git
cd omnibus-toolchain
bundle install --without development
sudo env FORCE_UNSAFE_CONFIGURE=1 ~/.rbenv/shims/bundle exec omnibus build omnibus-toolchain
```

That's it. At this point, the toolchain is installed in /opt/omnibus-toolchain and an DEB package for it is available in /var/cache/omnibus/pkg

Epilogue
--------

All changes made to your environment for the rbenv installation were temporary and can now be removed manually, or simply by logging out and then logging back into your shell account (or open a new terminal) at which point you can `rm -rf ~/.rbenv` to remove the temporary environment. The omnibus-toolchain includes a complete ruby.

Common Problems
---------------

On some platforms, the ffi rubygem will fail to compile its native extensions. Most distributions include a version of libffi which has support for your platform, which we install as part of the preconditions above. However, it may be too old for the ffi rubygem. If this is the case, the best course of action is to install the latest version of [libffi](https://sourceware.org/libffi/) attempt to compile it and install it as root. If it's installed and visible via pkg-config then the ffi rubygem will use that instead of the older native code included within its codebase.
