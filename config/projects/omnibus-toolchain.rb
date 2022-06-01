#
# Copyright:: Chef Software, Inc.
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
friendly_name "Omnibus Toolchain"
maintainer "Chef Software Inc"
homepage   "https://www.chef.io"
license "Apache-2.0"
license_file "LICENSE"

build_iteration 1
# Do not use __FILE__ after this point, use current_file. If you use __FILE__
# after this point, any dependent defs (ex: angry-omnibus-toolchain) that
# use instance_eval will fail to work correctly.
current_file ||= __FILE__
version_file = File.expand_path("../../../VERSION", current_file)
build_version IO.read(version_file).strip

if windows?
  install_dir  "#{default_root}/opscode/#{name}"
  package_name "omnibus-toolchain"

  # libxslt 1.1.35 does not build successfully with libxml2 2.9.13 on Windows so we will pin
  # windows builds to libxslt 1.1.34 and libxml2 2.9.10 for now and followup later with the
  # work to fix that issue in IPACK-145.
  override "libxml2", version: "2.9.10"
  override "libxslt", version: "1.1.34"
else
  install_dir "#{default_root}/#{name}"
end

if aix?
  # libtool 2.4.7 has a bug that needs to be fixed
  override :libtool, version: "2.4.6"
end

# riding berkshelf master is hard when you're at the edge of versions
override :berkshelf, version: "v8.0.1"

override :openssl, version: (aix? || windows?) ? "1.1.1m" : "3.0.1"

# it is important to set the default ruby version here. some software definitions such as
# nokogiri determine whether to compile or not on windows
override :ruby, version: aix? ? "3.0.3" : "3.1.2"

# xproto 7.0.31 became the default version in omnibus-software but it failed to build on
# multiple non-x86_64 systems. (e.g. arm64, ppc64)
override :xproto, version: "7.0.25"

if solaris?
  # More recent versions of git build on Solaris but "git name-rev" doesn't work properly which fails Chef Infra tests
  override :git, version: "2.24.1"

  # Solaris fails compile on libtool version 2.4.2 and 2.4.6
  override :libtool, version: "2.4"
end


# creates required build directories
dependency "preparation"

# Split the toolchain defs into their own software def so we can have
# a custom whitelist
dependency "omnibus-toolchain"

dependency "ruby-cleanup"

exclude '\.git*'
exclude 'bundler\/git'

package :rpm do
  signing_passphrase ENV["OMNIBUS_RPM_SIGNING_PASSPHRASE"]
end

# This is so that angry-omnibus-toolchain will end up with the correct name
proj_to_work_around_cleanroom = self
package :pkg do
  identifier "com.getchef.pkg.#{proj_to_work_around_cleanroom.name}"
  signing_identity "Chef Software, Inc. (EU3VF8YLX2)"
end
compress :dmg

msi_upgrade_code = "3A542C80-3784-4C03-A2CE-94FED4EB7002"
project_location_dir = name
package :msi do
  fast_msi true
  upgrade_code msi_upgrade_code
  wix_candle_extension "WixUtilExtension"
  wix_light_extension "WixUtilExtension"
  signing_identity "AF21BA8C9E50AE20DA9907B6E2D4B0CC3306CA03", machine_store: true
  parameters ProjectLocationDir: project_location_dir
end

package :appx do
  signing_identity "AF21BA8C9E50AE20DA9907B6E2D4B0CC3306CA03", machine_store: true
end
