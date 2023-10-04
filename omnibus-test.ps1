# Stop script execution when a non-terminating error occurs
$ErrorActionPreference = "Stop"

$Env:PATH = "C:\opscode\$Env:PRODUCT\embedded\bin;$Env:PATH"

$embedded_bin_dir = "C:\opscode\$Env:PRODUCT\embedded\bin"

# sync certs $
smctl windows certsync --keypair-alias=key_495941360

# Exercise various packaged tools to validate binstub shebangs
& $embedded_bin_dir\ruby --version
If ($lastexitcode -ne 0) { Throw $lastexitcode }

& $embedded_bin_dir\bundle --version
If ($lastexitcode -ne 0) { Throw $lastexitcode }

& $embedded_bin_dir\git --version
If ($lastexitcode -ne 0) { Throw $lastexitcode }

& $embedded_bin_dir\ruby -r openssl -e "puts 'Ruby can load OpenSSL'"
If ($lastexitcode -ne 0) { Throw $lastexitcode }
