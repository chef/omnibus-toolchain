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
friendly_name "Omnibus Toolchain"
maintainer "Chef Software Inc"
homepage   "https://www.chef.io"
license "Apache-2.0"
license_file "LICENSE"

if windows?
  install_dir  "#{default_root}/opscode/#{name}"
  package_name "omnibus-toolchain"
else
  install_dir "#{default_root}/#{name}"
end

build_version IO.read(File.expand_path("../../../VERSION", __FILE__)).strip
build_iteration 1

override :ruby,     version: "2.3.1"
override :git,      version: "2.10.2"
override :gtar,     version: "1.28"
override :rubygems, version: "2.6.10"
# Do not use 1.14.6 - this has the the issue that bundler#5515 will fix once
# they release. This breaks on Windows with a 'Illformed requirement' error
override :bundler,  version: "1.13.6"
# TODO: Fix this asap - for some reason curl and openssl > 1.0.1u fail
# on aix with a SSL23_GET_SERVER_HELLO issue.
if aix? || solaris_10?
  override :openssl, version: "1.0.1u"
end

# creates required build directories
dependency "preparation"

# Split the toolchain defs into their own software def so we can have
# a custom whitelist
dependency "omnibus-toolchain"

exclude '\.git*'
exclude 'bundler\/git'

package :rpm do
  signing_passphrase ENV["OMNIBUS_RPM_SIGNING_PASSPHRASE"]
end

# This is so that angry-omnibus-toolchain will end up with the correct name
proj_to_work_around_cleanroom = self
package :pkg do
  identifier "com.getchef.pkg.#{proj_to_work_around_cleanroom.name}"
  signing_identity "Developer ID Installer: Chef Software, Inc. (EU3VF8YLX2)"
end
compress :dmg

msi_upgrade_code = "3A542C80-3784-4C03-A2CE-94FED4EB7002"
project_location_dir = name
package :msi do
  fast_msi true
  upgrade_code msi_upgrade_code
  wix_candle_extension "WixUtilExtension"
  wix_light_extension "WixUtilExtension"
  signing_identity "F74E1A68005E8A9C465C3D2FF7B41F3988F0EA09", machine_store: true
  parameters ProjectLocationDir: project_location_dir
end

package :appx do
  signing_identity "F74E1A68005E8A9C465C3D2FF7B41F3988F0EA09", machine_store: true
end
