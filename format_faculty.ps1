$names = @(
    "Dr. Anuj Kumar Sharma",
    "Dr. Saurabh Mishra",
    "Dr. A.V.Ullas",
    "Dr. Siddharth Yadav",
    "Dr. Vijay Singh",
    "Dr. Vibhu Kumar Tripathi",
    "Dr. Naresh Chandra Maurya",
    "DR. PARUL SINGH",
    "Dr. Prachi Gupta",
    "Dr. Narendra Pal",
    "Mr.Hrishikesh Kumar Singh",
    "Dr. Chandramani Upadhyay",
    "Dr. Rohit Prakash"
)

$lines = Get-Content -Path "raw_faculty.txt" -Encoding UTF8
$blocks = @()
$currentBlock = @()

foreach ($line in $lines) {
    if ($line.Trim() -eq "Faculty Details") { continue }
    
    $isName = $false
    foreach ($name in $names) {
        if ($line.Trim() -eq $name) {
            $isName = $true
            break
        }
    }
    
    if ($isName) {
        if ($currentBlock.Count -gt 0) {
            $blocks += ,$currentBlock
        }
        $currentBlock = @($line)
    } else {
        if ($currentBlock.Count -gt 0) {
            $currentBlock += $line
        }
    }
}
if ($currentBlock.Count -gt 0) {
    $blocks += ,$currentBlock
}

$html = @"
            <img src="https://images.unsplash.com/photo-1524178232363-1fb2b075b655?auto=format&fit=crop&w=1200&q=80" class="course-banner" alt="Faculty Banner">
            
            <div style="margin-bottom: 50px; text-align: center;">
                <p style="font-size: 1.1rem; max-width: 800px; margin: 0 auto; line-height: 1.8;">Our distinguished faculty members are renowned researchers and academicians dedicated to fostering innovation and excellence in engineering and technology.</p>
            </div>

            <div class="faculty-grid" style="display: grid; grid-template-columns: 1fr; gap: 40px; margin-bottom: 60px;">
"@

foreach ($block in $blocks) {
    $name = $block[0].Trim()
    $sidebar = ""
    $bio = ""
    
    for ($i = 1; $i -lt $block.Count; $i++) {
        $line = $block[$i].Trim()
        if ($line -eq "") { continue }
        
        if ($line.Length -gt 130) {
            $bio += "<p style='margin-bottom: 15px; font-size: 0.95rem; line-height: 1.7; color: var(--text-dark);'>$line</p>`n"
        } else {
            if ($line -match "^[-•]") {
                $item = $line.Substring(1).Trim()
                $sidebar += "<div style='margin-bottom: 8px; padding-left: 15px; text-indent: -15px;'>&#8226; $item</div>`n"
            } elseif ($line.ToLower() -eq "click here for:") {
                $sidebar += "<strong style='color: var(--accent-light-blue); display: block; margin-top: 15px; margin-bottom: 5px;'>Links</strong>`n"
            } elseif ($line.ToLower() -match "area of interest") {
                $sidebar += "<strong style='color: var(--accent-light-blue); display: block; margin-top: 15px; margin-bottom: 5px;'>Area of Interest</strong>`n"
            } elseif ($line.ToLower() -match "scholar" -or $line.ToLower() -match "research gate" -or $line.ToLower() -match "orcid" -or $line.ToLower() -match "publication" -or $line.ToLower() -match "home page") {
                $sidebar += "<a href='#' style='display: block; color: var(--primary); margin-bottom: 5px; text-decoration: none;'>$line &rarr;</a>`n"
            } else {
                $sidebar += "<div style='margin-bottom: 8px; font-weight: 500;'>$line</div>`n"
            }
        }
    }
    
    $encodedName = [uri]::EscapeDataString($name)
    $dummyImageUrl = "https://ui-avatars.com/api/?name=$encodedName&background=0A3D62&color=fff&size=200&font-size=0.4&rounded=true"

    $html += @"
                <div class="glass-card reveal-up" style="padding: 30px;">
                    <h3 style="color: var(--primary); border-bottom: 1px solid rgba(255,255,255,0.1); padding-bottom: 15px; margin-bottom: 25px; font-size: 1.5rem;">$name</h3>
                    <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 40px;">
                        <div class="faculty-details" style="font-size: 0.9rem; color: #cbd5e1;">
                            <div style="text-align: center; margin-bottom: 20px;">
                                <img src="$dummyImageUrl" alt="$name" style="width: 150px; height: 150px; border-radius: 50%; border: 4px solid var(--accent-light-blue); box-shadow: 0 4px 15px rgba(0,0,0,0.1); object-fit: cover; margin: 0 auto;">
                            </div>
                            $sidebar
                        </div>
                        <div class="faculty-bio">
                            $bio
                        </div>
                    </div>
                </div>
"@
}

$html += "            </div>`n"

Set-Content -Path "faculty_content.txt" -Value $html -Encoding UTF8
Write-Host "Faculty HTML generated successfully."
