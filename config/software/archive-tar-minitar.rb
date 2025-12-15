name "archive-tar-minitar"
default_version "0.12"

license "MIT"
license_file "https://raw.githubusercontent.com/minitar/minitar/main/LICENSE.txt"

dependency "ruby"

build do
  env = with_standard_compiler_flags(with_embedded_path)
  gem "install archive-tar-minitar -v #{version} --no-document", env: env
end