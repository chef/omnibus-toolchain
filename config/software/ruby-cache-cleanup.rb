#
# Copyright:: Copyright (c) 2014-2020, Chef Software Inc.
# License:: Apache License, Version 2.0
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
# Common cleanup routines for ruby apps (InSpec, Workstation, Chef, etc)
#
# Heavily borrowed from ruby-cleanup script in omnibus-software
# macOS signing fails on double bundler check in ruby-cleanup so forking it here
#
require "fileutils"

name "ruby-cache-cleanup"
default_version "1.0.0"

license :project_license
skip_transitive_dependency_licensing true

build do
  env = with_standard_compiler_flags(with_embedded_path)

  # Clear the now-unnecessary gem caches, docs, and build information to allow mac notarization to pass
  block "Delete bundler git cache, docs, and build info" do
    gemdir = shellout!("#{install_dir}/embedded/bin/gem environment gemdir", env: env).stdout.chomp

    remove_directory "#{gemdir}/cache"
    remove_directory "#{gemdir}/doc"
    remove_directory "#{gemdir}/build_info"
  end
end