#
# Copyright 2019 Chef Software, Inc.
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

name "helper-exe"

source path: "#{project.files_path}/helper-exe"

license :project_license
skip_transitive_dependency_licensing true

windows_architecture = windows_arch_i386? ? "x86" : "x64"

build do

  %w(
    check-omnibus-package-signed.ps1
    get-architecture.ps1
    install-omnibus-product.ps1
    load-omnibus-toolchain.ps1
  ).each do |helper|
    erb source: "#{helper}.erb",
        dest: "#{install_dir}/bin/#{helper}",
        vars: {
          install_dir: install_dir,
          architecture: windows_architecture
        }
  end
end
