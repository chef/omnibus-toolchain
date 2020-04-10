#!/bin/bash
set -ueo pipefail

channel="${CHANNEL:-unstable}"
product="${PRODUCT:-omnibus-toolchain}"
version="${VERSION:-latest}"
toolchain="${TOOLCHAIN:-angry-omnibus-toolchain}"

# Following code to determine is_u_aarch64 is temporary fix to onboard ubuntu-18.04 aarch64
# This an be safely removed after successful release of omnibus-toolchain with ubuntu-18.04 aarch64

if [[ $TOOLCHAIN == "angry-omnibus-toolchain" && $INSTALL_TOOLCHAIN == "true"  ]]; then
  echo "--- Installing angry-omnibus-toolchain to be used for installing and testing omnibus-toolchain"
  if [[ ${BUILDKITE_AGENT_META_DATA_QUEUE:-} == "omnibus-ubuntu-18.04-aarch64" ]]; then
    /opt/omnibus-toolchain/bin/install-omnibus-product -P angry-omnibus-toolchain -c unstable
  else
    /opt/omnibus-toolchain/bin/install-omnibus-product -P angry-omnibus-toolchain
  fi
  # linking bash fails on macOS 10.15 and later so return true
  sudo ln -sf /opt/angry-omnibus-toolchain/embedded/bin/bash /bin/bash || true
fi

echo "--- Installing $channel $product $version"
package_file="$("/opt/$toolchain/bin/install-omnibus-product" -c "$channel" -P "$product" -v "$version" | tail -1)"

echo "--- Verifying omnibus package is signed"
"/opt/$toolchain/bin/check-omnibus-package-signed" "$package_file"

sudo rm -f "$package_file"

echo "--- Verifying ownership of package files"

export INSTALL_DIR="/opt/$product"
NONROOT_FILES="$(find "$INSTALL_DIR" ! -user 0 -print)"
if [[ "$NONROOT_FILES" == "" ]]; then
  echo "Packages files are owned by root.  Continuing verification."
else
  echo "Exiting with an error because the following files are not owned by root:"
  echo "$NONROOT_FILES"
  exit 1
fi

echo "--- Running verification for $channel $product $version"

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
