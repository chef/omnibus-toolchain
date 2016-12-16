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

#
# This is a clone of the Chef project that we can install on the Chef build and
# test machines. As such this project definition is just a thin wrapper around
# `config/project/chef.rb`.
#
toolchain_project_contents = IO.read(File.expand_path("../omnibus-toolchain.rb", __FILE__))
self.instance_eval toolchain_project_contents

name "angry-omnibus-toolchain"
friendly_name "Angry Omnibus Toolchain"
maintainer "Chef Software, Inc."
homepage   "http://www.chef.io"
license "Apache-2.0"
license_file "LICENSE"

if windows?
  install_dir "#{default_root}/opscode/#{name}"
  package_name "angry-omnibus-toolchain"
else
  install_dir "#{default_root}/#{name}"
end

resources_path "#{resources_path}/../omnibus-toolchain"

msi_upgrade_code = "6662C48D-761B-4E1D-91B8-9F17B9B36428"
project_location_dir = "angry-omnibus-toolchain"
