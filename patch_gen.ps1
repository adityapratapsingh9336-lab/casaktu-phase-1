$content = Get-Content "generate_pages.ps1" -Raw -Encoding UTF8

$oldResearchBlock = [regex]::Match($content, '(?s)# 9\. Research(.*?)Generate-Page -Filename "research.html"').Value
$oldPublicationsBlock = [regex]::Match($content, '(?s)# 10\. Publications(.*?)Generate-Page -Filename "publications.html"').Value

$newResearchBlock = @"
# 9. Research
`$researchRaw = Get-Content "generated_overview.html" -Raw -Encoding UTF8
`$researchContent = @"
            <img src="https://images.unsplash.com/photo-1581091226825-a6a2a5aee158?auto=format&fit=crop&w=1200&q=80" class="course-banner" alt="Research Banner">
            
            <div style="margin-bottom: 50px;">
                `$researchRaw
            </div>
"@
Generate-Page -Filename "research.html"
"@

$newPublicationsBlock = @"
# 10. Publications
`$publicationsRaw = Get-Content "generated_publications.html" -Raw -Encoding UTF8
`$publicationsContent = @"
            <div style="margin-bottom: 40px; text-align: center;">
                <p style="font-size: 1.1rem; max-width: 800px; margin: 0 auto;">Our scholars consistently publish high-quality research articles in impactful SCI/Scopus indexed journals and top-tier conferences.</p>
            </div>
            
            <h2 style="border-bottom: 2px solid var(--accent-light-blue); padding-bottom: 10px; margin-bottom: 30px;">Publications by Faculty Members/Students</h2>
            <div style="display: flex; flex-direction: column; gap: 20px; margin-bottom: 60px;">
                `$publicationsRaw
            </div>
"@
Generate-Page -Filename "publications.html"
"@

# Fix the Generate-Page calls in the replacement text
$newResearchBlock = $newResearchBlock -replace 'Generate-Page -Filename "research.html"', 'Generate-Page -Filename "research.html" -Title "Research & Innovation" -Content $researchContent'
$newPublicationsBlock = $newPublicationsBlock -replace 'Generate-Page -Filename "publications.html"', 'Generate-Page -Filename "publications.html" -Title "Publications & Patents" -Content $publicationsContent'

$content = $content.Replace($oldResearchBlock, $newResearchBlock)
$content = $content.Replace($oldPublicationsBlock, $newPublicationsBlock)

Set-Content "generate_pages.ps1" -Value $content -Encoding UTF8
Write-Host "Patched generate_pages.ps1"
