#! /bin/bash
set -ueo pipefail

# Fix permissions on .bundle if it exists
export BUNDLE_DIR="/home/jenkins/.bundle"
export BUNDLE_SOL_DIR="/export/home/jenkins/.bundle"
if [[ -d "$BUNDLE_DIR" ]]; then
  sudo chown -R jenkins:jenkins "$BUNDLE_DIR"
elif [[ -d "$BUNDLE_SOL_DIR" ]]; then
  sudo chown -R jenkins:jenkins "$BUNDLE_SOL_DIR"
fi

# Set up a custom tmpdir, and clean it up before and after the tests
TMPDIR="${TMPDIR:-/tmp}/ot_test"
export TMPDIR
sudo rm -rf "$TMPDIR"
mkdir -p "$TMPDIR"

BINDIR="$INSTALL_DIR/bin/"

# Explicitly call the one we expect to be there.
"$BINDIR/bash" --version
"$BINDIR/berks" --version || true # not on non-linux
"$BINDIR/bundle" --version
"$BINDIR/curl" --version
"$BINDIR/gem" --version
"$BINDIR/git" --version
"$BINDIR/gmake" --version
"$BINDIR/gtar" --version
"$BINDIR/make" --version
"$BINDIR/patch" --version
"$BINDIR/rake" --version
"$BINDIR/ruby" --version
"$BINDIR/tar" --version

export PATH="$BINDIR:$PATH"

cd "$TMPDIR"
"$BINDIR/git" clone https://github.com/chef/omnibus-toolchain.git
cd omnibus-toolchain
"$BINDIR/bundle" install --without development --path ./vendor/bundle
"$BINDIR/bundle" exec rake -T
cd "$TMPDIR"
rm -rf ot_test
