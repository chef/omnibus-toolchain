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
default_version "20161025"

version "20160921" do
  source sha256: "4527d71caf97b42e7f2c0c3d7fd80bacd36c2efc60ab81142ae9943ce3470e31"
end

version "20161025" do
  source sha256: "bb1f1a0b35b3d96bf9c15092da8ce969a84a134f7b08811292fbc9d84d48c65d"
end

# HTTPS currently not available.
source url: "http://repo.msys2.org/distrib/x86_64/msys2-base-x86_64-#{version}.tar.xz"

# We use a 64-bit msys environment to build both 32 and 64 bit binaries.
relative_path "msys64"

license "Apache-2.0"
license_file "https://github.com/chef/chef/blob/master/LICENSE"

if windows_arch_i386?
  CARCH = "i686".freeze
else
  CARCH = "x86_64".freeze
end

build do
  env = with_standard_compiler_flags(with_embedded_path)

  # Invoke the commands within the msys we unpack, rather than any other msys
  # which may be in the system path.
  base_shell_cmd = "#{project_dir}/msys2_shell.cmd -c"

  # Setup the bashrc that will be used for bash -c commands via BASH_ENV
  erb source: "bashrc.erb",
      dest: "#{project_dir}/etc/msys2.bashrc",
      mode: 0755

  # run msys2_shell once so it can set up its internals and quit
  command "#{base_shell_cmd} \"exit\""
  # TODO: DON'T UPDATE PACMAN as of 11/30/16 this causes all following pacman
  # commands to return 127
  # # run msys2_shell to update pacman
  # command "#{base_shell_cmd} \"pacman -Sy pacman --noconfirm\"", env: env
  # run msys2_shell to update system packages
  command "#{base_shell_cmd} \"pacman -Syuu --noconfirm\"", env: env
  # run msys2_shell to update the rest of the packages
  command "#{base_shell_cmd} \"pacman -Su --noconfirm\"", env: env

  # ################
  # these should be put into a different definition
  # ################
  # gcc
  command "#{base_shell_cmd} \"pacman -S --needed --noconfirm mingw-w64-#{CARCH}-gcc\"", env: env
  # binutils
  command "#{base_shell_cmd} \"pacman -S --needed --noconfirm mingw-w64-#{CARCH}-binutils\"", env: env
  # gnumake
  command "#{base_shell_cmd} \"pacman -S --needed --noconfirm mingw-w64-#{CARCH}-make\"", env: env
  # libtool
  command "#{base_shell_cmd} \"pacman -S --needed --noconfirm mingw-w64-#{CARCH}-libtool\"", env: env
  # autoconf
  command "#{base_shell_cmd} \"pacman -S --needed --noconfirm msys/autoconf\"", env: env
  # automake
  command "#{base_shell_cmd} \"pacman -S --needed --noconfirm msys/automake\"", env: env
  # autogen (required for building ZMQ)
  command "#{base_shell_cmd} \"pacman -S --needed --noconfirm msys/autogen\"", env: env
  # diffutils (required for building OpenSSL)
  command "#{base_shell_cmd} \"pacman -S --needed --noconfirm msys/diffutils\"", env: env
  # msys gnumake
  command "#{base_shell_cmd} \"pacman -S --needed --noconfirm msys/make\"", env: env
  # patch
  command "#{base_shell_cmd} \"pacman -S --needed --noconfirm msys/patch\"", env: env
  # Install bsdtar because tar interprets : as a tape selector or something weird.
  # bsdtar interprets it as a path and translates it correctly
  # https://chefio.slack.com/archives/_msys2_omnibus_effort/p1479491465000316
  command "#{base_shell_cmd} \"pacman -S --needed --noconfirm msys/bsdtar\"", env: env
  copy "#{project_dir}/usr/bin/bsdtar.exe", "#{project_dir}/usr/bin/tar.exe"
  # Perl is required to build openssl, however perl doesn't seem to be able to build
  # out of the box. We install the msys version for now.
  command "#{base_shell_cmd} \"pacman -S --needed --noconfirm msys/perl\"", env: env
  # ################
  # these should be put into a different definition
  # ################

  # deploy to the final install directory
  copy "#{project_dir}/*", "#{install_dir}/embedded/bin"
end
