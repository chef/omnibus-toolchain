#!/bin/sh

set -evx

TMPDIR="${TMPDIR:-/tmp}/ot_test"
export TMPDIR
sudo rm -rf $TMPDIR
mkdir -p $TMPDIR

# we don't really have to be super careful with the path and ruby, we just
# want to be first.
PATH=/opt/$PROJECT_NAME/bin:$PATH
export PATH

bash --version
berks --version || true # not on non-linux
bundle --version
curl --version
fakeroot --version || true # not on all platforms
gem --version
git --version
gmake --version
gtar --version
make --version
patch --version
pkg-config --version
rake --version
ruby --version
tar --version

cd $TMPDIR
git clone git@github.com:chef/omnibus-toolchain.git
cd omnibus-toolchain
bundle install --without development --path ./vendor/bundle
bundle exec rake -T
cd $TMPDIR
rm -rf ot_test