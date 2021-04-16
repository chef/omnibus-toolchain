# Stop script execution when a non-terminating error occurs
$ErrorActionPreference = "Stop"

$channel = "$Env:CHANNEL"
If ([string]::IsNullOrEmpty($channel)) { $channel = "unstable" }

$product = "$Env:PRODUCT"
If ([string]::IsNullOrEmpty($product)) { $product = "omnibus-toolchain" }

$version = "$Env:VERSION"
If ([string]::IsNullOrEmpty($version)) { $version = "latest" }

$package_file = "$Env:PACKAGE_FILE"
If ([string]::IsNullOrEmpty($package_file)) { $package_file = "" }

If ($package_file -eq "") {
  Write-Output "--- Installing $channel $product $version"
  $package_file = $(.omnibus-buildkite-plugin\install-omnibus-product.ps1 -Product "$product" -Channel "$channel" -Version "$version" | Select-Object -Last 1)
} 
Else {
  Write-Output "--- Installing $product $version"
  $package_file = $(.omnibus-buildkite-plugin\install-omnibus-product.ps1 -Package "$package_file" -Product "$product" -Version "$version" | Select-Object -Last 1)
}

If ($product -eq "omnibus-toolchain") {
  $toolchain = "angry-omnibus-toolchain"
}
Else {
  $toolchain = "omnibus-toolchain"
}

Write-Output "--- Verifying omnibus package is signed"
& "C:\opscode\${toolchain}\bin\check-omnibus-package-signed.ps1" "$package_file"

Write-Output "--- Running verification for $channel $product $version"

$Env:PATH = "C:\opscode\$product\embedded\bin;$Env:PATH"

$embedded_bin_dir = "C:\opscode\$product\embedded\bin"
$project_bin_dir = "C:\opscode\$product\bin"

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
