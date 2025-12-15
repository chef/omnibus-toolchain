name "archive-tar-minitar"
default_version "0.12"

license "MIT"

dependency "ruby"

build do
  env = with_standard_compiler_flags(with_embedded_path)
  gem "install archive-tar-minitar -v #{version} --no-document", env: env
end