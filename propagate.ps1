$indexContent = Get-Content -Path index.html -Raw

$headerMatch = [regex]::Match($indexContent, '(?s)<!-- Institutional Header -->(.*?)<!-- Navigation Bar -->')
$newHeader = $headerMatch.Groups[0].Value

$footerMatch = [regex]::Match($indexContent, '(?s)<!-- Footer -->(.*?)<script src="js/script.js"></script>')
$newFooter = $footerMatch.Groups[0].Value

if ([string]::IsNullOrEmpty($newHeader) -or [string]::IsNullOrEmpty($newFooter)) {
    Write-Host "Could not extract header or footer."
    exit
}

$htmlFiles = Get-ChildItem -Path . -Filter *.html | Where-Object { $_.Name -ne 'index.html' }

foreach ($file in $htmlFiles) {
    $content = Get-Content -Path $file.FullName -Raw
    
    $content = [regex]::Replace($content, '(?s)<!-- Institutional Header -->.*?<!-- Navigation Bar -->', $newHeader)
    $content = [regex]::Replace($content, '(?s)<!-- Footer -->.*?<script src="js/script.js"></script>', $newFooter)
    
    Set-Content -Path $file.FullName -Value $content -Encoding UTF8
    Write-Host "Updated $($file.Name)"
}
Write-Host "Propagation complete."
