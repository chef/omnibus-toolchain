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

name "git-for-windows"
default_version "2.10.1.windows.2"

version "2.10.1.windows.2" do
  source sha256: "e41bf5c4f9490586f9a08e780806a44731c793682a03b4340c465a177136c7db"
end

source url: "https://github.com/git-for-windows/git/archive/v#{version}.tar.gz"

dependency "zlib"
dependency "openssl"

relative_path "git-#{version}"

license "GPL-2.0"
license_file "https://raw.githubusercontent.com/git-for-windows/git/master/COPYING"

configure_command = [
  '--with-libpcre=no',
  '--with-tcltk=no',
  '--with-expat=no',
]

build do
  env = with_standard_compiler_flags(with_embedded_path)

  command('autoconf', in_msys_bash: true, env: env)

  configure(configure_command.join(" "), env: env)

  command('make install', in_msys_bash: true, env: env)
end
