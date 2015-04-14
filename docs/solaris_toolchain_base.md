Installing the Base Solaris 10 Omnibus Toolchain
==================

In order to build the omnibus-build-essential project, one needs a base toolchain installed. Unfortunately, the only way to start from scratch is to build everything manually from source once, which then allows you to build the SAME toolchain in an automated way. This document describes the minimum manual steps required.

Preconditions/Assumptions
-------------------------
* You are running on a Solaris 10 machine that is the earliest update that you wish to support. Due to libc versioning, building this on u5 (for example) will allow this package to work on u5 and later, but not earlier.
* Make sure you have the Solaris Math Libraries package install, otherwise gcc will fail to compile with some reaaaaaally un-helpful errors.
* You have done a manual OS installation of Solaris 10 with at least the base compilation toolchain. (See [this](http://docs.oracle.com/cd/E19253-01/html/817-0545/eezbb.html#x86packagelist-tbl-1) link for an early x86 package list)
```
SUNWlibm
SUNWlibmr
SUNWlibms
SUNWlibmsr
SUNWgcc
SUNWgccruntime
SUNWgcmn
SUNWggrp
SUNWgm4
SUNWgmake
SUNWbtool
SUNWtoo
SUNWscpr
SUNWscpu
```
* When you partitioned the drive, you left lots of room (20gb+) in / and didn't do anything special for /var or /opt.
* __This document was based on running Solaris10u5 x86 in a VM__

Base Setup and 'Helper' Installation
------------------------------------
### Enable ssh for root
* Log in as root
* Enable remote root login - change `PermitRootLogin` to `yes`
```
vi /etc/ssh/sshd_config
svcadm restart ssh
```

### Get sudo
* Install sudo package, create an admin group and add to sudoers file
```
cd /tmp
/usr/sfw/bin/wget http://www.sudo.ws/sudo/dist/packages/Solaris/10/TCMsudo-1.8.11p2-i386.pkg.gz
gunzip TCMsudo-1.8.11p2-i386.pkg.gz
pkgadd -d TCMsudo-1.8.11p2-i386.pkg all
groupadd admin
echo "%admin ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
```

### Set up your user
* Adjust as needed for your username :)
```
useradd -d /export/home/<username> -s /usr/bin/bash -m -G admin <username>
```
* May as well check it out and make sure it works, right?
```
su - <username>
/usr/local/bin/sudo echo bla
```
* (optional) Update your profile for aliases and prompt
* (optional) Add your ssh keys so you can log in directly
* Set path (this is sort of optional but I would HIGHLY recommend doing it if you want the rest of the steps to work correctly)
* Here is an example of what my .bash_profile looks like
```
if [ -f /etc/profile ]; then
  . /etc/profile
fi
if [ "$PS1" ]; then
  if [ "$BASH" ]; then
    PS1='\u@\h:\w$ '
    if [ -f /etc/bash.bashrc ]; then
      . /etc/bash.bashrc
    fi
  else
    if [ "`id -u`" -eq 0 ]; then
      PS1='# '
    else
      PS1='$ '
    fi
  fi
fi
PATH=/usr/local/bin:/usr/sfw/bin:/usr/ccs/bin:/usr/sbin:/usr/bin:$PATH
export PATH
alias ll='ls -la'
```
* __At this point you should be able to run sudo, gcc, and yacc without fully qualifying your path.__

Building the Base Packages
--------------------------
The next step is to install all the things in the toolchain in the appropriate order. Make directory to build out of (I'm using ~/build); we'll assume the next commands are all run with that as the base directory.

We will be building everything into __/opt/be__

### Create /opt/be
```
sudo mkdir /opt/be
sudo chown <username> /opt/be
```

### Create your map file (1.22.1 represents Sol10u1)
I called this file 'solaris_mapfile', and put it in ~/build/
```
$mapfile_version 2
DEPEND_VERSIONS libc.so {
  ALLOW = SUNW_1.22.1;
  ALLOW = SUNW_1.1;
  ALLOW = SUNWprivate_1.1;
};
```

### Set default environment variables
I made a file that I could source that has these variables in it, for ease of use.
Note the LD_OPTIONS path to the mapfile.
```
export CC="gcc -static-libgcc"
export LDFLAGS="-R/opt/be/embedded/lib -L/opt/be/embedded/lib -static-libgcc"
export CFLAGS="-I/opt/be/embedded/include"
export LD_RUN_PATH="/opt/be/embedded/lib"
export LD_OPTIONS="-R/opt/be/embedded/lib -M /export/home/<username>/build/solaris_mapfile"
export PKG_CONFIG_PATH="/opt/be/embedded/lib/pkgconfig"
export CXXFLAGS=$CFLAGS
```

### gnu patch
```
wget http://ftp.gnu.org/gnu/patch/patch-2.7.tar.gz
gtar xzf patch-2.7.tar.gz
cd patch-2.7
./configure --prefix=/opt/be/embedded
gmake -j 3
gmake -j 3 install
cd ..
```

### GMP
```
wget --no-check-certificate https://ftp.gnu.org/gnu/gmp/gmp-6.0.0a.tar.bz2
bunzip2 gmp-6.0.0a.tar.bz2
gtar xf gmp-6.0.0a.tar
cd gmp-6.0.0
x86: ABI=32 ./configure --prefix=/opt/be/embedded
SPARC: CC="gcc -static-libgcc -mcpu=v9" ABI=32 ./configure --prefix=/opt/be/embedded
gmake -j 3
gmake -j 3 install
cd ..
```
### MPFR
```
wget http://www.mpfr.org/mpfr-current/mpfr-3.1.2.tar.gz
gtar zxf mpfr-3.1.2.tar.gz
cd mpfr-3.1.2
./configure --prefix=/opt/be/embedded
gmake -j 3
gmake -j 3 install
cd ..
```
### MPC
```
wget ftp://ftp.gnu.org/gnu/mpc/mpc-1.0.2.tar.gz
gtar zxf mpc-1.0.2.tar.gz
cd mpc-1.0.2
./configure --prefix=/opt/be/embedded
gmake -j 3
gmake -j 3 install
cd ..
```
### libiconv (including patch)
```
wget http://ftp.gnu.org/pub/gnu/libiconv/libiconv-1.14.tar.gz
gtar xzf libiconv-1.14.tar.gz
cd libiconv-1.14
wget --no-check-certificate https://raw.githubusercontent.com/opscode/omnibus-software/master/config/patches/libiconv/libiconv-1.14_srclib_stdio.in.h-remove-gets-declarations.patch
/opt/be/embedded/bin/patch -p1 -i libiconv-1.14_srclib_stdio.in.h-remove-gets-declarations.patch
./configure --prefix=/opt/be/embedded
gmake -j 3
gmake -j 3 install
cd ..
```
### gcc (this takes for ages, be patient!)
```
wget ftp://gcc.gnu.org/pub/gcc/releases/gcc-4.9.2/gcc-4.9.2.tar.gz
gtar xzf gcc-4.9.2.tar.gz
cd gcc-4.9.2
./configure --prefix=/opt/be/embedded --disable-nls --enable-languages=c,c++ --with-as=/usr/ccs/bin/as --with-ld=/usr/ccs/bin/ld
gmake -j 3
gmake -j 3 install
cd ..
```
### zlib
```
wget http://downloads.sourceforge.net/project/libpng/zlib/1.2.8/zlib-1.2.8.tar.gz
gtar zxf zlib-1.2.8.tar.gz
cd zlib-1.2.8
CFLAGS="-I/opt/be/embedded/include -DNO_VIZ" ./configure --prefix=/opt/be/embedded
gmake -j 3
gmake -j 3 install
cd ..
```
### cacerts
```
mkdir /opt/be/embedded/ssl
mkdir /opt/be/embedded/ssl/certs
wget http://curl.haxx.se/ca/cacert.pem
mv cacert.pem /opt/be/embedded/ssl/certs
ln -s /opt/be/embedded/ssl/certs/cacert.pem /opt/be/embedded/ssl/cert.pem
```
### xproto
```
wget http://xorg.freedesktop.org/releases/individual/proto/xproto-7.0.25.tar.gz
gtar zxf xproto-7.0.25.tar.gz
cd xproto-7.0.25
./configure --prefix=/opt/be/embedded
gmake -j 3
gmake -j 3 install
cd ..
```
### util-macros
```
wget http://xorg.freedesktop.org/releases/individual/util/util-macros-1.18.0.tar.gz
gtar zxf util-macros-1.18.0.tar.gz
cd util-macros-1.18.0
./configure --prefix=/opt/be/embedded
gmake -j 3
gmake -j 3 install
cd ..
```
### pkg-config
```
wget http://pkgconfig.freedesktop.org/releases/pkg-config-0.28.tar.gz
gtar zxf pkg-config-0.28.tar.gz
cd pkg-config-0.28
./configure --prefix=/opt/be/embedded --disable-debug --disable-host-tool --with-internal-glib --with-pc-path=/opt/be/embedded/bin/pkgconfig
cd glib
./configure --prefix=/opt/be/embedded --with-libiconv=gnu
cd ..
gmake -j 3
gmake -j 3 install
cd ..
```
### makedepend
```
export PKG_CONFIG=/opt/be/embedded/bin/pkg-config
wget http://xorg.freedesktop.org/releases/individual/util/makedepend-1.0.5.tar.gz
gtar zxf makedepend-1.0.5.tar.gz
cd makedepend-1.0.5
./configure --prefix=/opt/be/embedded
gmake -j 3
gmake -j 3 install
cd ..
```
### openssl (omg longest ./configure evar!)
note - change x86 to sparcv9 on sparc
```
wget http://www.openssl.org/source/openssl-1.0.1k.tar.gz
gtar zxf openssl-1.0.1k.tar.gz
cd openssl-1.0.1k
wget --no-check-certificate https://raw.githubusercontent.com/opscode/omnibus-software/master/config/patches/openssl/openssl-1.0.1f-do-not-build-docs.patch
/opt/be/embedded/bin/patch -p1 -i openssl-1.0.1f-do-not-build-docs.patch
CFLAGS="-L/opt/be/embedded/lib -I/opt/be/embedded/include" LDFLAGS="-R/opt/be/embedded/lib -L/opt/be/embedded/lib -I/opt/be/embedded/embedded/include -static-libgcc" LD_OPTIONS="-R/opt/be/embedded/embedded/lib" /bin/sh ./Configure solaris-x86-gcc --prefix=/opt/be/embedded --with-zlib-lib=/opt/be/embedded/lib --with-zlib-include=/opt/be/embedded/include no-idea no-mdc2 no-rc5 zlib shared -L/opt/be/embedded/lib -I/opt/be/embedded/include -R/opt/be/embedded/lib -static-libgcc
Edit the Makefile and change this:
MAKEDEPPROG=/opt/be/embedded/bin/makedepend
gmake depend
gmake
gmake install
cd ..
```
### ncurses
```
wget http://ftp.gnu.org/gnu/ncurses/ncurses-5.9.tar.gz
gtar zxf ncurses-5.9.tar.gz
cd ncurses-5.9
./configure --prefix=/opt/be/embedded --with-shared --with-termlib --without-debug --without-normal --enable-overwrite --enable-widec --without-cxx-binding
gmake -j 3
gmake -j 3 install
gmake distclean
./configure --prefix=/opt/be/embedded --with-shared --with-termlib --without-debug --without-normal --enable-overwrite --without-cxx-binding
gmake -j 3
gmake -j 3 install
cd ..
```
### libedit
```
wget http://www.thrysoee.dk/editline/libedit-20120601-3.0.tar.gz
gtar zxf libedit-20120601-3.0.tar.gz
cd libedit-20120601-3.0
./configure --prefix=/opt/be/embedded
gmake -j 3
gmake -j 3 install
cd ..
```
### pcre
```
wget http://iweb.dl.sourceforge.net/project/pcre/pcre/8.31/pcre-8.31.tar.gz
gtar zxf pcre-8.31.tar.gz
cd pcre-8.31
./configure --prefix=/opt/be/embedded --enable-pcretest-libedit
gmake -j 3
gmake install
cd ..
```
### expat
```
wget http://iweb.dl.sourceforge.net/project/expat/expat/2.1.0/expat-2.1.0.tar.gz
gtar zxf expat-2.1.0.tar.gz
cd expat-2.1.0
./configure --prefix=/opt/be/embedded
gmake -j 3
gmake install
cd ..
```
### perl
```
wget http://www.cpan.org/src/5.0/perl-5.18.1.tar.gz
gtar zxf perl-5.18.1.tar.gz
cd perl-5.18.1
sh Configure -de -Dprefix=/opt/be/embedded -Duseshrplib -Dusethreads -Dcc='gcc -static-libgcc -Wl,-M /export/home/shain/dev/solaris_mapfile' -Dnoextensions='DB_File GDBM_File NDBM_File ODBM_File'
gmake -j 3
gmake install
cd ..
```
### gnu m4 - required for autoconf
```
wget http://ftp.gnu.org/gnu/m4/m4-1.4.17.tar.gz
gtar zxf m4-1.4.17.tar.gz
cd m4-1.4.17
./configure --prefix=/opt/be/embedded
gmake -j 3
gmake install
cd ..
```
### gnu autoconf - we need to update the git defs in omnibus-software I think...
```
wget http://ftp.gnu.org/gnu/autoconf/autoconf-2.68.tar.gz
gtar zxf autoconf-2.68.tar.gz
cd autoconf-2.68
M4=/opt/be/embedded/bin/m4 ./configure --prefix=/opt/be/embedded
gmake -j 3
gmake install
```
### git
```
wget --no-check-certificate https://www.kernel.org/pub/software/scm/git/git-2.2.1.tar.gz
gtar zxf git-2.2.1.tar.gz
cd git-2.2.1
./configure --prefix=/opt/be/embedded --without-python --without-tcltk
gmake -j 3
gmake install
cd ..
```
### libyaml
```
wget http://pyyaml.org/download/libyaml/yaml-0.1.6.tar.gz
gtar zxf yaml-0.1.6.tar.gz
cd yaml-0.1.6
./configure --prefix=/opt/be/embedded --enable-shared
gmake -j 3
gmake -j 3 install
cd ..
```
### libtool - (2.4.2 is not compatible with m4 1.4.17, use 2.4)
```
wget http://ftp.gnu.org/gnu/libtool/libtool-2.4.tar.gz
gtar zxf libtool-2.4.tar.gz
cd libtool-2.4
./configure --prefix=/opt/be/embedded
gmake -j 3
gmake install
cd ..
```

### libffi - use old make, bleh.
```
wget ftp://sourceware.org/pub/libffi/libffi-3.0.13.tar.gz
gtar zxf libffi-3.0.13.tar.gz
cd libffi-3.0.13
./configure --prefix=/opt/be/embedded
/usr/ccs/bin/make -j 3
/usr/ccs/bin/make install
cp /opt/be/embedded/lib/libffi-3.0.13/include/* /opt/be/embedded/include/
cd ..
```

### gdbm
```
wget http://ftp.gnu.org/gnu/gdbm/gdbm-1.9.1.tar.gz
gtar zxf gdbm-1.9.1.tar.gz
cd gdbm-1.9.1
./configure --prefix=/opt/be/embedded --enable-libgdbm-compat
gmake -j 3
gmake install
cd ..
```
### ruby
```
wget http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.5.tar.gz
gtar zxf ruby-2.1.5.tar.gz
cd ruby-2.1.5
wget --no-check-certificate https://raw.githubusercontent.com/opscode/omnibus-software/shain/omni-b-e/config/patches/ruby/ruby-solaris-no-stack-protector.patch
/opt/be/embedded/bin/patch -p1 -i ruby-solaris-no-stack-protector.patch
CFLAGS="-I/opt/be/embedded/include -O3 -g -pipe" ./configure --prefix=/opt/be/embedded --with-out-ext=dbm --enable-shared --enable-libedit --with-ext=psych --disable-install-doc --without-gmp --disable-dtrace --with-opt-dir=/opt/be/embedded
gmake -j 3
gmake -j 3 install
cd ..
```
## rubygems
```
wget http://production.cf.rubygems.org/rubygems/rubygems-2.4.4.tgz
gtar zxf rubygems-2.4.4.tgz
cd rubygems-2.4.4
/opt/be/embedded/bin/ruby setup.rb --no-ri --no-rdoc
cd ..
```
### bundler (you may need to do this later)
```
/opt/be/embedded/bin/gem install bundler --version 1.5.3 --no-ri --no-rdoc
```

Phase 2 - The first build
==================
Once this is done, you should be able to reset your environment (remove the variables),
add /opt/be/embedded/bin to the front of your path, check out the omnibus-build-essential
project from github and run bundle install / bundle exec omnibus build build-essential.
