$lines = Get-Content -Path "extracted_user_inputs.txt" -Encoding UTF8
$overviewHTML = ""
$publicationsHTML = ""
$mode = "intro" # intro, overview, publications

foreach ($line in $lines) {
    $line = $line.Trim()
    if ([string]::IsNullOrWhiteSpace($line)) { continue }
    if ($line.StartsWith("<USER_REQUEST>")) { continue }
    if ($line.StartsWith("<truncated") -or $line.StartsWith("NOTE: ")) { continue }
    
    if ($line -match "^1\.Overview:") {
        $mode = "overview"
        continue
    }
    if ($line -match "^2\. publications:" -or $line -eq "Publications by Faculty Members/Students" -or $line -eq "Conference Proceedings/ Book Chapters") {
        $mode = "publications"
        continue
    }

    if ($mode -eq "intro") {
        # Skip the intro prompt text "in research there should be..."
        if ($line.StartsWith("in research there should")) { continue }
        $overviewHTML += "<p style='margin-bottom: 20px; line-height: 1.8;'>$line</p>`n"
    } elseif ($mode -eq "overview") {
        if ($line -match "^(.*?): (.*)") {
            $title = $matches[1]
            $desc = $matches[2]
            $overviewHTML += @"
                <div class="glass-card" style="margin-bottom: 20px;">
                    <h4 style="color: var(--primary); margin-bottom: 10px; font-size: 1.1rem;">$title</h4>
                    <p style="color: var(--text-dark); line-height: 1.6;">$desc</p>
                </div>
"@
        }
    } elseif ($mode -eq "publications") {
        # Strip numbering like "100. " or "1. "
        $pubText = $line -replace '^\d+\.\s*', ''
        if ($pubText.Length -gt 50) {
            $publicationsHTML += @"
                <div class="glass-card" style="display: flex; gap: 20px; align-items: flex-start; margin-bottom: 15px; padding: 20px;">
                    <i class="ph ph-article" style="font-size: 2rem; color: var(--primary); flex-shrink: 0;"></i>
                    <div>
                        <p style="font-size: 0.95rem; line-height: 1.6; color: var(--text-dark);">$pubText</p>
                    </div>
                </div>
"@
        }
    }
}

Set-Content -Path "generated_overview.html" -Value $overviewHTML -Encoding UTF8
Set-Content -Path "generated_publications.html" -Value $publicationsHTML -Encoding UTF8
Write-Host "Done formatting content."
