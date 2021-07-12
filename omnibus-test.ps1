# Stop script execution when a non-terminating error occurs
$ErrorActionPreference = "Stop"

$Env:PATH = "C:\opscode\$Env:PRODUCT\embedded\bin;$Env:PATH"

$embedded_bin_dir = "C:\opscode\$Env:PRODUCT\embedded\bin"
$project_bin_dir = "C:\opscode\$Env:PRODUCT\bin"

# Exercise various packaged tools to validate binstub shebangs
& $embedded_bin_dir\ruby --version
If ($lastexitcode -ne 0) { Exit $lastexitcode }

& $embedded_bin_dir\bundle.bat --version
If ($lastexitcode -ne 0) { Exit $lastexitcode }

& $embedded_bin_dir\git --version
If ($lastexitcode -ne 0) { Exit $lastexitcode }

& $project_bin_dir\load-omnibus-toolchain.ps1
If ($lastexitcode -ne 0) { Exit $lastexitcode }

exit $LASTEXITCODE
