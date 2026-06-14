$files = Get-ChildItem -Path . -Filter *.html
foreach ($file in $files) {
    $content = Get-Content -Path $file.FullName -Raw -Encoding UTF8
    $fileName = $file.Name
    
    # Remove active class from index.html (the default copied by generate_pages)
    $content = $content -replace '<a href="index.html" class="active">HOME</a>', '<a href="index.html">HOME</a>'
    
    if ($fileName -eq "index.html") {
        $content = $content -replace '<a href="index.html">HOME</a>', '<a href="index.html" class="active">HOME</a>'
    } else {
        # Apply active class to the direct link
        $content = $content -replace ('<a href="' + $fileName + '" class="dropbtn">'), ('<a href="' + $fileName + '" class="dropbtn active">')
        $content = $content -replace ('<a href="' + $fileName + '">'), ('<a href="' + $fileName + '" class="active">')
        
        # Determine parent menu and set it active
        $parentMap = @{
            "btech.html" = "PROGRAMS"
            "mtech.html" = "PROGRAMS"
            "bpharma.html" = "PROGRAMS"
            "mba.html" = "PROGRAMS"
            
            "research.html" = "RESEARCH"
            "publications.html" = "RESEARCH"
            
            "infrastructure.html" = "INFRASTRUCTURE"
            
            "activities.html" = "STUDENT'S CORNER"
            "alumni.html" = "STUDENT'S CORNER"
            "students.html" = "STUDENT'S CORNER"
            
            "events.html" = "EVENTS"
            "akam.html" = "EVENTS"
            
            "about.html" = "ABOUT"
        }
        
        $parent = $parentMap[$fileName]
        if ($parent -eq "PROGRAMS") {
            $content = $content -replace '<a href="javascript:void\(0\)" class="dropbtn">PROGRAMS', '<a href="javascript:void(0)" class="dropbtn active">PROGRAMS'
        } elseif ($parent -ne $null -and $parent -ne "ABOUT" -and $parent -ne "RESEARCH" -and $parent -ne "INFRASTRUCTURE") {
            # For menus where the top link is NOT an actual page, like STUDENTS CORNER or EVENTS
            # Wait, some are actual pages!
            # about.html is both the parent and the child? No, about.html IS the parent link!
            # So <a href="about.html" class="dropbtn"> gets caught by the normal replace.
            
            # Events
            if ($parent -eq "EVENTS") {
                $content = $content -replace '<a href="events.html" class="dropbtn">EVENTS', '<a href="events.html" class="dropbtn active">EVENTS'
            }
            # Students
            if ($parent -eq "STUDENT'S CORNER") {
                $content = $content -replace '<a href="students.html" class="dropbtn">STUDENT''S CORNER', '<a href="students.html" class="dropbtn active">STUDENT''S CORNER'
            }
        }
        
        # Specifically handle the parents that ARE the link themselves and have child pages
        # For example, if we are on publications.html, the parent RESEARCH (which links to research.html) must be active.
        if ($fileName -eq "publications.html") {
            $content = $content -replace '<a href="research.html" class="dropbtn">RESEARCH', '<a href="research.html" class="dropbtn active">RESEARCH'
        }
    }
    
    Set-Content -Path $file.FullName -Value $content -Encoding UTF8
}
Write-Host "Navigation updated successfully."
