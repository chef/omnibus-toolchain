
#
# Copyright 2016 Chef Software, Inc.
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
# expeditor/ignore: deprecated 2021-04

name "berkshelf-no-depselector"
default_version "main"

license "Apache-2.0"
license_file "LICENSE"

source git: "https://github.com/berkshelf/berkshelf.git"

relative_path "berkshelf"

dependency "ruby"

unless windows? && (project.overrides[:ruby].nil? || project.overrides[:ruby][:version] == "ruby-windows")
  dependency "libarchive"
end

dependency "nokogiri"
dependency "archive-tar-minitar"

build do
  env = with_standard_compiler_flags(with_embedded_path)

  # Configure bundler
  bundle "config set --local without guard changelog development test", env: env
  bundle "install --jobs #{workers}", env: env

  # Build the berkshelf gem
  bundle "exec thor gem:build", env: env

  # Install the built gem
  gem "install pkg/berkshelf-*.gem --no-document", env: env

  # Create omnibus wrapper for berks
  create_bin_wrapper "berks", "#{install_dir}/embedded/bin/ruby", env
end