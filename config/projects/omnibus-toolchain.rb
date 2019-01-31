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
else
  install_dir "#{default_root}/#{name}"
end

override :ruby,     version: "2.5.3"
override :gtar,     version: "1.28"
# there's an issue with curl later versions (ntlm + smb) on AIX
override :curl, version: '7.47.1'
# riding berkshelf master is hard when you're at the edge of versions
override :berkshelf, version: "v6.3.1"

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
  signing_identity "E05FF095D07F233B78EB322132BFF0F035E11B5B", machine_store: true
  parameters ProjectLocationDir: project_location_dir
end

package :appx do
  signing_identity "E05FF095D07F233B78EB322132BFF0F035E11B5B", machine_store: true
end
