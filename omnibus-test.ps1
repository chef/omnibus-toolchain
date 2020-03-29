# Stop script execution when a non-terminating error occurs
$ErrorActionPreference = "Stop"

$channel = "$Env:CHANNEL"
If ([string]::IsNullOrEmpty($channel)) { $channel = "unstable" }

$product = "$Env:PRODUCT"
If ([string]::IsNullOrEmpty($product)) { $product = "omnibus-toolchain" }

$version = "$Env:VERSION"
If ([string]::IsNullOrEmpty($version)) { $version = "latest" }

$toolchain = "$Env:TOOLCHAIN"
If ([string]::IsNullOrEmpty($toolchain)) { $toolchain = "angry-omnibus-toolchain" }

If ($toolchain -eq "angry-omnibus-toolchain") {
  Write-Output "--- Installing angry-omnibus-toolchain to be used for installing and testing omnibus-toolchain"
  C:\opscode\omnibus-toolchain\bin\install-omnibus-product.ps1 -Product angry-omnibus-toolchain
}

Write-Output "--- Installing $channel $product $version"
$package_file = $(& "C:\opscode\${toolchain}\bin\install-omnibus-product.ps1" -Product "$product" -Channel "$channel" -Version "$version" | Select-Object -Last 1)

Write-Output "--- Verifying omnibus package is signed"
& "C:\opscode\${toolchain}\bin\check-omnibus-package-signed.ps1" "$package_file"

Write-Output "--- Running verification for $channel $product $version"

# We don't want to add the embedded bin dir to the main PATH as this
# could mask issues in our binstub shebangs.
$embedded_bin_dir = "C:\opscode\$product\embedded\bin"

# Exercise various packaged tools to validate binstub shebangs
& $embedded_bin_dir\ruby --version
& $embedded_bin_dir\bundle.bat --version
& $embedded_bin_dir\gem.bat --version

exit $LASTEXITCODE