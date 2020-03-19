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

dependency "libtool" if aix?

# gnu utilities
if windows?
  dependency "cmake"
  dependency "msys2core"
  dependency "git-windows"
else
  dependency "bash"
  dependency "git"
  dependency "gtar"
  dependency "make"
  dependency "patch"
end

dependency "cacerts"

# ruby core tools
dependency "ruby"
dependency "bundler"

if linux? || mac_os_x?
  dependency "berkshelf" unless i386? || ios_xr? || nexus? || armhf?
end

# Include helpers for build pipelines
dependency "helper-gems"

if windows?
  dependency "helper-exe"
else
  dependency "helper-sh"
end

# For Solaris 10 and Freebsd 9 we assume that you have installed the system gcc
# package this means that pcre is going to link against it, and it's ok in this
# case
if solaris2? || (freebsd? && ohai["os_version"].to_i < 1000024)
  whitelist_file /libpcrecpp\.so\..+/
end

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