$indexContent = Get-Content -Path "index.html" -Raw -Encoding UTF8

$headerNavMatch = [regex]::Match($indexContent, '(?s)(<!-- Institutional Header -->.*?</nav>)')
$newHeaderNav = $headerNavMatch.Groups[1].Value

if ([string]::IsNullOrEmpty($newHeaderNav)) {
    Write-Host "Could not extract header and nav."
    exit
}

$htmlFiles = Get-ChildItem -Path . -Filter *.html | Where-Object { $_.Name -ne 'index.html' }

foreach ($file in $htmlFiles) {
    $content = Get-Content -Path $file.FullName -Raw -Encoding UTF8
    
    $content = [regex]::Replace($content, '(?s)<!-- Institutional Header -->.*?</nav>', $newHeaderNav)
    
    Set-Content -Path $file.FullName -Value $content -Encoding UTF8
    Write-Host "Updated $($file.Name)"
}
Write-Host "Propagation complete."
