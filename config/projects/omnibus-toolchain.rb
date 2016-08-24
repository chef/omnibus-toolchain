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

name 'omnibus-toolchain'
maintainer "Chef Software Inc"
homepage   "https://www.chef.io"
license "Apache-2.0"
license_file "LICENSE"

install_dir    '/opt/omnibus-toolchain'

build_version Omnibus::BuildVersion.semver
build_iteration 1

override :ruby, version: "2.2.5"
override :git,  version: "2.8.2"
override :gtar,  version: "1.28"

# creates required build directories
dependency 'preparation'

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
