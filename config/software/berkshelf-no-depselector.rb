#
# Copyright 2016 Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# You may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#

name "berkshelf-no-depselector"
default_version "main"

license "Apache-2.0"
license_file "LICENSE"

source git: "https://github.com/berkshelf/berkshelf.git"
relative_path "berkshelf"

dependency "ruby"
dependency "nokogiri"
dependency "archive-tar-minitar"
dependency "libarchive" unless windows?

build do
  # Standard compiler flags and embedded Ruby paths
  env = with_standard_compiler_flags(with_embedded_path)

  # Install project dependencies
  bundle "config set --local without guard changelog development test", env: env
  bundle "install --jobs #{workers}", env: env

  # Build the gem
  bundle "exec thor gem:build", env: env

  # Install the built Berkshelf gem
  gem "install pkg/berkshelf-*.gem --no-document", env: env

  # Ensure minitar is installed (runtime dependency)
  gem "install minitar --no-document", env: env

  # Patch the binstub to require minitar at runtime
  block "patch_berks_binstub_for_minitar" do
    binstub = File.join(install_dir, "embedded/bin/berks")
    next unless File.exist?(binstub)

    inject = "require 'archive/tar/minitar'\n"
    contents = File.read(binstub)
    unless contents.include?(inject)
      lines = contents.lines
      lines.insert(1, inject) # after shebang
      File.write(binstub, lines.join)
    end
  end

  # Create a robust wrapper that always uses embedded Ruby
  block "create_bin_wrapper_for_berks" do
    original_binstub = File.join(install_dir, "embedded/bin/berks")
    wrapper_path    = File.join(install_dir, "bin/berks")

    wrapper = <<~WRAPPER
      #!#{install_dir}/embedded/bin/ruby
      require 'archive/tar/minitar'
      load File.expand_path('#{original_binstub}', __dir__)
    WRAPPER

    File.write(wrapper_path, wrapper)
    FileUtils.chmod(0o755, wrapper_path)
  end
end