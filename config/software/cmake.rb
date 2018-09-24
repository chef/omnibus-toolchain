#
# Copyright 2018 Chef Software, Inc.
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

name "cmake"
default_version "3.12.2"

dependency "cacerts"

license "BSD-3-Clause"
skip_transitive_dependency_licensing true
version("3.12.2") { source sha256: "7212130c7798c994fe22ed5cbf5fa454cdaea636b07d1571c015606929f92c9a" }
minor_version = version.split(".")[0..1].join(".")

if windows?
  if windows_arch_i386?
    source url: "https://cmake.org/files/v#{minor_version}/cmake-#{version}-win32-x86.zip", sha256: "fde814282b798a8064aab8c44ddf2f7a25e1139b5a2b3a255adedacfca5706cd"
    relative_path "cmake-#{version}-win32-x86"
    license_file "doc/cmake/Copyright.txt"
  else
    source url: "https://cmake.org/files/v#{minor_version}/cmake-#{version}-win64-x64.zip", sha256: "25c8dbe3e81095463b0d6ccefd836275791299502e3ed5eccf695e118a6d031b"
    relative_path "cmake-#{version}-win64-x64"
    license_file "doc/cmake/Copyright.txt"
  end
else
  source url: "https://cmake.org/files/v#{minor_version}/cmake-#{version}.tar.gz"
  relative_path "cmake-#{version}"
  license_file "Copyright.txt"
end

build do
  # It's hard-slash-impossible to build cmake on windows without cmake, so we don't even try
  if windows?
    copy "bin/cmake.exe", "#{install_dir}/embedded/bin"
  else
    env = with_standard_compiler_flags(with_embedded_path)

    command "./bootstrap --prefix=#{install_dir}/embedded", env: env

    make "-j #{workers}", env: env
    make "install", env: env
  end
end
