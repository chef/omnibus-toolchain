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
default_version "3.23.1"

dependency "cacerts"

license "BSD-3-Clause"
skip_transitive_dependency_licensing true
version("3.23.1") { source sha256: "33fd10a8ec687a4d0d5b42473f10459bb92b3ae7def2b745dc10b192760869f3" }
minor_version = version.split(".")[0..1].join(".")

if windows?
  if windows_arch_i386?
    source url: "https://cmake.org/files/v#{minor_version}/cmake-#{version}-windows-i386.zip", sha256: "5bb01d27dc665aac5ddbdb24eebfb2146601e150884b2b1540d39ceb61875f3f"
    relative_path "cmake-#{version}-windows-i386"
    license_file "doc/cmake/Copyright.txt"
  else
    source url: "https://cmake.org/files/v#{minor_version}/cmake-#{version}-windows-x86_64.zip", sha256: "9b509cc4eb7191dc128cfa3f2170036f9cbc7d9d5f93ff7fafc5b2d77b3b40dc"
    relative_path "cmake-#{version}-windows-x86_64"
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
