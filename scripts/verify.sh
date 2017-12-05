#!/bin/sh

set -evx

# Set up a custom tmpdir, and clean it up before and after the tests
TMPDIR="${TMPDIR:-/tmp}/toolchaintest"
export TMPDIR
rm -rf $TMPDIR
mkdir -p $TMPDIR

# $PROJECT_NAME is set by Jenkins, this allows us to use the same script to verify
# omnibus-toolchain and angry-omnibus-toolchain
PATH=/opt/$PROJECT_NAME/bin:$PATH
export PATH

BIN_DIR=/opt/$PROJECT_NAME/bin
export BIN_DIR

# We don't want to add the embedded bin dir to the main PATH as this
# could mask issues in our binstub shebangs.
EMBEDDED_BIN_DIR=/opt/$PROJECT_NAME/embedded/bin
export EMBEDDED_BIN_DIR

# If we are on Mac our symlinks are located under /usr/local/bin
# otherwise they are under /usr/bin
if [ -f /usr/bin/sw_vers ]; then
  USR_BIN_DIR="/usr/local/bin"
else
  USR_BIN_DIR="/usr/bin"
fi
export USR_BIN_DIR

# Ensure the calling environment (disapproval look Bundler) does not
# infect our Ruby environment created by the `chef-client` cli.
for ruby_env_var in _ORIGINAL_GEM_PATH \
                    BUNDLE_BIN_PATH \
                    BUNDLE_GEMFILE \
                    GEM_HOME \
                    GEM_PATH \
                    GEM_ROOT \
                    RUBYLIB \
                    RUBYOPT \
                    RUBY_ENGINE \
                    RUBY_ROOT \
                    RUBY_VERSION \
                    BUNDLER_VERSION

do
  unset $ruby_env_var
done


$EMBEDDED_BIN_DIR/ruby --version
$EMBEDDED_BIN_DIR/git --version
$EMBEDDED_BIN_DIR/bundle --version

# verify that git and ruby works
$EMBEDDED_BIN_DIR/git clone https://github.com/chef/omnibus-harmony.git $TMPDIR/git_test
$EMBEDDED_BIN_DIR/bundle install --no-color --gemfile $TMPDIR/git_test/Gemfile --path $TMPDIR/git_test/vendor

# clean up tmpdir
rm -rf $TMPDIR
