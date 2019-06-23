# Stop script execution when a non-terminating error occurs
$ErrorActionPreference = "Stop"

$channel = "$Env:CHANNEL"
If ([string]::IsNullOrEmpty($channel)) { $channel = "unstable" }

$product = "$Env:PRODUCT"
If ([string]::IsNullOrEmpty($product)) { $product = "chef" }

$version = "$Env:VERSION"
If ([string]::IsNullOrEmpty($version)) { $version = "latest" }

If ($Env:TOOLCHAIN -eq "angry-omnibus-toolchain") {
  Write-Output "--- Installing angry-omnibus-toolchain to be used for installing and testing omnibus-toolchain"
  C:\opscode\omnibus-toolchain\bin\install-omnibus-product.ps1 -Product angry-omnibus-toolchain
}

Write-Output "--- Installing $channel $product $version"
$package_file = $(C:\opscode\${Env:TOOLCHAIN}\bin\install-omnibus-product.ps1 -Product "$product" -Channel "$channel" -Version "$version" | Select-Object -Last 1)

Write-Output "--- Verifying omnibus package is signed"
C:\opscode\${Env:TOOLCHAIN}\bin\check-omnibus-package-signed.ps1 "$package_file"

Write-Output "--- Running verification for $channel $product $version"

$Env:PATH = "C:\opscode\$product\bin;$Env:PATH"
