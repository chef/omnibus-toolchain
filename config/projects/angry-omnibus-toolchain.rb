#
# Copyright 2012-2014 Chef Software, Inc.
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
toolchain_project_contents = IO.read(File.expand_path('../omnibus-toolchain.rb', __FILE__))
self.instance_eval toolchain_project_contents

name 'angry-omnibus-toolchain'
friendly_name 'Angry Omnibus Toolchain'
maintainer 'Chef Software, Inc.'
homepage   'http://www.chef.io'

install_dir "/opt/angry-omnibus-toolchain"
