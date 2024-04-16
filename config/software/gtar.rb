#
# Copyright 2016-2019 Chef Software, Inc.
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

name "gtar"
default_version "1.34"

version("1.34") { source sha256: "03d908cf5768cfe6b7ad588c921c6ed21acabfb2b79b788d1330453507647aed" }
version("1.32") { source sha256: "b59549594d91d84ee00c99cf2541a3330fed3a42c440503326dab767f2fbb96c" }

license "GPL-3.0"
license_file "COPYING"

source url: "http://ftp.gnu.org/gnu/tar/tar-#{version}.tar.gz"

relative_path "tar-#{version}"

build do
  env = with_standard_compiler_flags(with_embedded_path)

  configure_command = [
    "./configure",
    "--prefix=#{install_dir}/embedded",
  ]

  # First off let's disable selinux support, as it causes issues on some platforms
  # We're not doing it on every platform because this breaks on OSX
  unless osx?
    configure_command << " --without-selinux"
  end

  if s390x?
    configure_command << " --without-posix-acls"
  end

  command configure_command.join(" "), env: env
  make "-j #{workers}", env: env
  make "-j #{workers} install", env: env
end
