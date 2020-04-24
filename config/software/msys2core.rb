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

name "msys2core"

# We use a 64-bit msys environment to build both 32 and 64 bit binaries.

license "Apache-2.0"
license_file "https://github.com/chef/chef/blob/master/LICENSE"

if windows_arch_i386?
  CARCH = "i686".freeze
else
  CARCH = "x86_64".freeze
end

build do
  env = with_standard_compiler_flags(with_embedded_path)

  choco_msys2dir = "c:/tools/msys64"

  # Setup the bashrc that will be used for bash -c commands via BASH_ENV
  
  erb source: "check-priv.ps1.erb",
      dest: "#{project_dir}/check-priv.ps1",
      mode: 0755
  
  erb source: "msys2-install.ps1.erb",
      dest: "#{project_dir}/msys2-install.ps1",
      mode: 0755

  # ################
  # these should be put into a different definition
  # ################
  # Check user run priviledges
  command "powershell.exe #{project_dir}/check-priv.ps1"

  block "Delete the file after reporting user priviledge mode" do
    env["VISUAL"] = "echo"
    remove_file "#{project_dir}/check-priv.ps1"
  end
  
  # Install msys2 using  powershell script
  command "powershell.exe #{project_dir}/msys2-install.ps1"

  block "Delete the msys2 installation powershell script post install" do
    env["VISUAL"] = "echo"
    remove_file "#{project_dir}/msys2-install.ps1"
  end

  # deploy to the final install directory
  copy "#{choco_msys2dir}/*", "#{install_dir}/embedded/bin"
end
