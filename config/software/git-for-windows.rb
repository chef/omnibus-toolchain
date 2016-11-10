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
default_version "2.10.1"

arch = _64_bit? ? '64-bit' : '32-bit'

if windows_arch_i386?
  version("2.10.1") { source sha256: "bcdeb7c00771f0e8e96689f704d158e8dcf67fdb4178f1ea3f388e877398a2c7" }
else
  version("2.10.1") { source sha256: "a7268f4ab447e62940347d52fe01321403cfa3e9e94b8e5cac4d6ded28962d64" }
end

# git-for-windows has a build version extension which is specific to their
# binaries. This hash allows us to map the value appropriately.
BUILD_VERSIONS = {
  '2.10.1': 'windows.1',
}.freeze

source url: "http://github.com/git-for-windows/git/releases/download/v#{version}.#{BUILD_VERSIONS[version.to_sym]}/MinGit-#{version}-#{arch}.zip"

relative_path "git-#{version}"

license "GPL-2.0"
license_file "https://raw.githubusercontent.com/git-for-windows/git/master/COPYING"

build do
#  source_archive = "#{project_dir}/MinGit-#{version}-#{arch}.zip"
  destination = "#{install_dir}/embedded/git"

  mkdir windows_safe_path(destination)
  copy "#{project_dir}/", "#{to_msys2_path(destination)}"
end
