$path = 'C:\Users\TUFF\.gemini\antigravity-ide\brain\75db1363-65bd-474d-9266-3dd07b5c2cbf\.system_generated\logs\transcript.jsonl'
$content = Get-Content -Path $path -Encoding UTF8 -Raw
$lines = $content -split "`n"
$output = ""
foreach ($line in $lines) {
    if ([string]::IsNullOrWhiteSpace($line)) { continue }
    try {
        $obj = $line | ConvertFrom-Json
        if ($obj.type -eq 'USER_INPUT') {
            $output = $obj.content
        }
    } catch {}
}
Set-Content -Path "extracted_user_inputs.txt" -Value $output -Encoding UTF8
Write-Host "Done"
