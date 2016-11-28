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
default_version "20160921"

version "20160921" do
  source md5: "18e78478b0f0345b6b992462d20f7e53"
end

source url: "http://repo.msys2.org/distrib/x86_64/msys2-base-x86_64-#{version}.tar.xz"

relative_path "msys64"

license "Apache-2.0"
license_file "https://github.com/chef/chef/blob/master/LICENSE"

build do
  env = with_standard_compiler_flags(with_embedded_path)
  # run msys2_shell once so it can set up its internals and quit
  command "msys2_shell.cmd -c \"exit\""
  # run msys2_shell to update pacman
  command "msys2_shell.cmd -c \"pacman -Sy pacman --noconfirm\"", env: env
  # run msys2_shell to update system packages
  command "msys2_shell.cmd -c \"pacman -Syuu --noconfirm\"", env: env
  # run msys2_shell to update the rest of the packages
  command "msys2_shell.cmd -c \"pacman -Su --noconfirm\"", env: env

  # ################
  # these should be put into a different definition
  # ################
  # gcc
  command "msys2_shell.cmd -c \"pacman -S --needed --noconfirm mingw64/mingw-w64-x86_64-gcc\"", env: env
  # binutils
  command "msys2_shell.cmd -c \"pacman -S --needed --noconfirm mingw64/mingw-w64-x86_64-binutils\"", env: env
  # ################
  # these should be put into a different definition
  # ################

  # deploy to the final install directory
  copy "#{project_dir}/*", "#{install_dir}/embedded/bin"




end
