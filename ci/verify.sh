#!/bin/sh

set -evx

TMPDIR="${TMPDIR:-/tmp}/ot_test"
export TMPDIR
sudo rm -rf $TMPDIR
mkdir -p $TMPDIR

BINDIR=/opt/$PROJECT_NAME/bin/

# Explicitly call the one we expect to be there.
$BINDIR/bash --version
$BINDIR/berks --version || true # not on non-linux
$BINDIR/bundle --version
$BINDIR/curl --version
$BINDIR/fakeroot --version || true # not on all platforms
$BINDIR/gem --version
$BINDIR/git --version
$BINDIR/gmake --version
$BINDIR/gtar --version
$BINDIR/make --version
$BINDIR/patch --version
$BINDIR/rake --version
$BINDIR/ruby --version
$BINDIR/tar --version

cd $TMPDIR
$BINDIR/git clone git@github.com:chef/omnibus-toolchain.git
cd omnibus-toolchain
$BINDIR/bundle install --without development --path ./vendor/bundle
$BINDIR/bundle exec rake -T
cd $TMPDIR
rm -rf ot_test