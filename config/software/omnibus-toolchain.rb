#
# Copyright 2015-2016, Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

name "omnibus-toolchain"
default_version "1.0.0"

license :project_license

# gnu utilities
if windows?
  dependency "cmake"
  dependency "git-windows"
else
  dependency "libtool"
  dependency "libarchive"
  dependency "bash"
  dependency "git"
  dependency "gtar"
  dependency "make"
  dependency "makedepend"
  dependency "patch"
end

dependency "cacerts"

# ruby core tools
dependency "ruby"

# Projects such as Chef Server, Supermarket, Chef Manage and Chef Backend use berkshelf for the build time installation of gems.
# Moving it to toolchain avoids installing a ton of deps into our packages.
if linux? || macos?
  dependency "berkshelf" unless i386? || arm?
end

dependency "nokogiri"

# Include helpers for build pipelines
dependency "helper-gems"

build do
  env = with_standard_compiler_flags(with_embedded_path)

  # The mini-portile2 gem ships with some test fixture data compressed in a format Apple's notarization
  # service cannot understand. We need to delete that archive from gem cache to pass notarization.
  block "Delete test folder of mini-portile2 gem cache so downstream projects pass notarization" do
    env["VISUAL"] = "echo"
    gem_install_dir = shellout!("#{install_dir}/embedded/bin/gem environment gemdir", env: env).stdout.chomp
    remove_directory "#{gem_install_dir}/cache/mini_portile2-2.4.0.gem"
  end
end
