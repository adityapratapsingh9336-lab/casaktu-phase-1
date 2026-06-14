$indexContent = Get-Content -Path "index.html" -Raw -Encoding UTF8

# Extract top part
$topMatch = [regex]::Match($indexContent, '(?s)(<!DOCTYPE html>.*?</nav>)')
$topHtml = $topMatch.Groups[1].Value

# Extract bottom part
$bottomMatch = [regex]::Match($indexContent, '(?s)(<!-- Footer -->.*</html>)')
$bottomHtml = $bottomMatch.Groups[1].Value

function Generate-Page {
    param (
        [string]$Filename,
        [string]$Title,
        [string]$Content
    )

    $fullHtml = @"
$topHtml

    <!-- Page Header -->
    <section class="page-header">
        <div class="container">
            <h1>$Title</h1>
        </div>
    </section>

    <!-- Main Content -->
    <section>
        <div class="container">
$Content
        </div>
    </section>

$bottomHtml
"@

    Set-Content -Path $Filename -Value $fullHtml -Encoding UTF8
    Write-Host "Generated $Filename"
}

# 1. B.Tech
$btechContent = @"
            <img src="https://images.unsplash.com/photo-1581091226825-a6a2a5aee158?auto=format&fit=crop&w=1200&q=80" class="course-banner" alt="B.Tech Banner">
            
            <div class="grid-2" style="margin-bottom: 50px;">
                <div>
                    <h3 style="margin-bottom: 20px;">Program Overview</h3>
                    <p style="margin-bottom: 20px;">Our B.Tech program is designed to provide students with a strong foundation in engineering principles, coding, and hands-on practical experience. The curriculum is constantly updated to meet industry demands.</p>
                    
                    <h4 style="margin-bottom: 10px;">Branches Offered</h4>
                    <ul style="list-style-type: disc; margin-left: 20px; margin-bottom: 20px;">
                        <li>Computer Science and Engineering</li>
                        <li>Electronics and Communication Engineering</li>
                        <li>Mechanical Engineering</li>
                        <li>Civil Engineering</li>
                    </ul>
                </div>
                <div class="glass-card">
                    <h3 style="margin-bottom: 20px; color: var(--primary);">Key Details</h3>
                    <p style="margin-bottom: 10px;"><strong>Duration:</strong> 4 Years (8 Semesters)</p>
                    <p style="margin-bottom: 10px;"><strong>Eligibility:</strong> 10+2 with PCM (Minimum 60%)</p>
                    <p style="margin-bottom: 10px;"><strong>Fee Structure:</strong> INR 1,20,000 per annum</p>
                    <br>
                    <a href="admission.html" class="btn btn-primary" style="width: 100%; text-align: center;">Apply Now</a>
                </div>
            </div>

            <!-- Year Selection Tabs -->
            <h3 style="margin-bottom: 25px; text-align: center; border-bottom: 2px solid var(--accent-light-blue); padding-bottom: 10px;">Course Curriculum By Year</h3>
            <div class="year-tabs-container">
                <button class="year-tab active" data-year="1">1st Year</button>
                <button class="year-tab" data-year="2">2nd Year</button>
                <button class="year-tab" data-year="3">3rd Year</button>
                <button class="year-tab" data-year="4">4th Year</button>
            </div>

            <div class="year-contents-container" style="margin-bottom: 60px;">
                <!-- 1st Year -->
                <div class="year-content active glass-card" data-year="1">
                    <h4 style="margin-bottom: 15px; color: var(--primary);">1st Year (Semester I & II)</h4>
                    <div class="grid-2">
                        <div>
                            <h5 style="margin-bottom: 10px; font-weight: 600;">Semester I Core Courses</h5>
                            <ul style="list-style-type: square; margin-left: 20px;">
                                <li>Engineering Mathematics - I</li>
                                <li>Engineering Physics</li>
                                <li>Basic Electrical Engineering</li>
                                <li>Programming for Problem Solving</li>
                            </ul>
                        </div>
                        <div>
                            <h5 style="margin-bottom: 10px; font-weight: 600;">Semester II Core Courses</h5>
                            <ul style="list-style-type: square; margin-left: 20px;">
                                <li>Engineering Mathematics - II</li>
                                <li>Engineering Chemistry</li>
                                <li>Basic Mechanical Engineering</li>
                                <li>English for Professional Communication</li>
                            </ul>
                        </div>
                    </div>
                </div>

                <!-- 2nd Year -->
                <div class="year-content glass-card" data-year="2">
                    <h4 style="margin-bottom: 15px; color: var(--primary);">2nd Year (Semester III & IV)</h4>
                    <div class="grid-2">
                        <div>
                            <h5 style="margin-bottom: 10px; font-weight: 600;">Semester III Core Courses</h5>
                            <ul style="list-style-type: square; margin-left: 20px;">
                                <li>Data Structures & Algorithms</li>
                                <li>Digital Electronics</li>
                                <li>Discrete Mathematics</li>
                                <li>Computer Organization & Architecture</li>
                            </ul>
                        </div>
                        <div>
                            <h5 style="margin-bottom: 10px; font-weight: 600;">Semester IV Core Courses</h5>
                            <ul style="list-style-type: square; margin-left: 20px;">
                                <li>Operating Systems</li>
                                <li>Database Management Systems</li>
                                <li>Object-Oriented Programming</li>
                                <li>Theory of Computation</li>
                            </ul>
                        </div>
                    </div>
                </div>

                <!-- 3rd Year -->
                <div class="year-content glass-card" data-year="3">
                    <h4 style="margin-bottom: 15px; color: var(--primary);">3rd Year (Semester V & VI)</h4>
                    <div class="grid-2">
                        <div>
                            <h5 style="margin-bottom: 10px; font-weight: 600;">Semester V Core Courses</h5>
                            <ul style="list-style-type: square; margin-left: 20px;">
                                <li>Design & Analysis of Algorithms</li>
                                <li>Computer Networks</li>
                                <li>Software Engineering</li>
                                <li>Professional Elective - I</li>
                            </ul>
                        </div>
                        <div>
                            <h5 style="margin-bottom: 10px; font-weight: 600;">Semester VI Core Courses</h5>
                            <ul style="list-style-type: square; margin-left: 20px;">
                                <li>Compiler Design</li>
                                <li>Artificial Intelligence</li>
                                <li>Web Technologies</li>
                                <li>Professional Elective - II</li>
                            </ul>
                        </div>
                    </div>
                </div>

                <!-- 4th Year -->
                <div class="year-content glass-card" data-year="4">
                    <h4 style="margin-bottom: 15px; color: var(--primary);">4th Year (Semester VII & VIII)</h4>
                    <div class="grid-2">
                        <div>
                            <h5 style="margin-bottom: 10px; font-weight: 600;">Semester VII Core Courses</h5>
                            <ul style="list-style-type: square; margin-left: 20px;">
                                <li>Cryptography & Network Security</li>
                                <li>Cloud Computing</li>
                                <li>Major Project (Phase I)</li>
                                <li>Industrial Seminar</li>
                            </ul>
                        </div>
                        <div>
                            <h5 style="margin-bottom: 10px; font-weight: 600;">Semester VIII Core Courses</h5>
                            <ul style="list-style-type: square; margin-left: 20px;">
                                <li>Distributed Systems</li>
                                <li>Major Project (Phase II)</li>
                                <li>Comprehensive Viva-Voce</li>
                                <li>Open Elective</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Resource Downloads -->
            <div class="resources-section">
                <h3 style="margin-bottom: 25px; border-bottom: 2px solid var(--accent-light-blue); padding-bottom: 10px;">Resource Downloads</h3>
                <div class="download-grid">
                    <div class="glass-card download-card">
                        <i class="ph ph-file-pdf download-icon"></i>
                        <div class="download-info">
                            <h4>Course Syllabus</h4>
                            <p>Get the complete branch-wise syllabus details.</p>
                            <a href="#" class="btn-download"><i class="ph ph-download-simple"></i> Download PDF</a>
                        </div>
                    </div>
                    <div class="glass-card download-card">
                        <i class="ph ph-file-pdf download-icon"></i>
                        <div class="download-info">
                            <h4>Fee Structure</h4>
                            <p>Detailed breakdown of academic fees & charges.</p>
                            <a href="#" class="btn-download"><i class="ph ph-download-simple"></i> Download PDF</a>
                        </div>
                    </div>
                    <div class="glass-card download-card">
                        <i class="ph ph-file-pdf download-icon"></i>
                        <div class="download-info">
                            <h4>Academic Calendar</h4>
                            <p>Yearly planner including holidays & exam schedules.</p>
                            <a href="#" class="btn-download"><i class="ph ph-download-simple"></i> Download PDF</a>
                        </div>
                    </div>
                </div>
            </div>
"@
Generate-Page -Filename "btech.html" -Title "Bachelor of Technology (B.Tech)" -Content $btechContent

# 2. M.Tech
$mtechContent = @"
            <img src="https://images.unsplash.com/photo-1532094349884-543bc11b234d?auto=format&fit=crop&w=1200&q=80" class="course-banner" alt="M.Tech Banner">
            
            <div class="grid-2" style="margin-bottom: 50px;">
                <div>
                    <h3 style="margin-bottom: 20px;">Program Overview</h3>
                    <p style="margin-bottom: 20px;">The M.Tech program focuses on advanced research and specialization in emerging technologies. It equips students with deep technical expertise for R&D roles.</p>
                    
                    <h4 style="margin-bottom: 10px;">Specializations</h4>
                    <ul style="list-style-type: disc; margin-left: 20px; margin-bottom: 20px;">
                        <li>Artificial Intelligence & Data Science</li>
                        <li>Cyber Security</li>
                        <li>VLSI Design</li>
                        <li>Robotics & Automation</li>
                    </ul>
                </div>
                <div class="glass-card">
                    <h3 style="margin-bottom: 20px; color: var(--primary);">Key Details</h3>
                    <p style="margin-bottom: 10px;"><strong>Duration:</strong> 2 Years (4 Semesters)</p>
                    <p style="margin-bottom: 10px;"><strong>Eligibility:</strong> B.Tech/B.E. in relevant field with valid GATE score</p>
                    <p style="margin-bottom: 10px;"><strong>Fee Structure:</strong> INR 90,000 per annum</p>
                    <br>
                    <a href="admission.html" class="btn btn-primary" style="width: 100%; text-align: center;">Apply Now</a>
                </div>
            </div>

            <!-- Year Selection Tabs -->
            <h3 style="margin-bottom: 25px; text-align: center; border-bottom: 2px solid var(--accent-light-blue); padding-bottom: 10px;">Course Curriculum By Year</h3>
            <div class="year-tabs-container">
                <button class="year-tab active" data-year="1">1st Year</button>
                <button class="year-tab" data-year="2">2nd Year</button>
            </div>

            <div class="year-contents-container" style="margin-bottom: 60px;">
                <!-- 1st Year -->
                <div class="year-content active glass-card" data-year="1">
                    <h4 style="margin-bottom: 15px; color: var(--primary);">1st Year (Semester I & II)</h4>
                    <div class="grid-2">
                        <div>
                            <h5 style="margin-bottom: 10px; font-weight: 600;">Semester I Advanced Courses</h5>
                            <ul style="list-style-type: square; margin-left: 20px;">
                                <li>Mathematical Foundations of Computer Science</li>
                                <li>Advanced Algorithms & Analysis</li>
                                <li>Specialization Elective - I</li>
                                <li>Research Methodology & IPR</li>
                            </ul>
                        </div>
                        <div>
                            <h5 style="margin-bottom: 10px; font-weight: 600;">Semester II Advanced Courses</h5>
                            <ul style="list-style-type: square; margin-left: 20px;">
                                <li>Machine Learning and Pattern Recognition</li>
                                <li>Advanced Computer Networks</li>
                                <li>Specialization Elective - II</li>
                                <li>Mini-Project with Seminar</li>
                            </ul>
                        </div>
                    </div>
                </div>

                <!-- 2nd Year -->
                <div class="year-content glass-card" data-year="2">
                    <h4 style="margin-bottom: 15px; color: var(--primary);">2nd Year (Semester III & IV)</h4>
                    <div class="grid-2">
                        <div>
                            <h5 style="margin-bottom: 10px; font-weight: 600;">Semester III Thesis Phase I</h5>
                            <ul style="list-style-type: square; margin-left: 20px;">
                                <li>Dissertation Phase - I (Literature Review)</li>
                                <li>Industry Internship / Seminar</li>
                                <li>Open Elective</li>
                            </ul>
                        </div>
                        <div>
                            <h5 style="margin-bottom: 10px; font-weight: 600;">Semester IV Thesis Phase II</h5>
                            <ul style="list-style-type: square; margin-left: 20px;">
                                <li>Dissertation Phase - II (Implementation & Testing)</li>
                                <li>Research Publication (Journal/Conference)</li>
                                <li>Final Defense and Viva-Voce</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Resource Downloads -->
            <div class="resources-section">
                <h3 style="margin-bottom: 25px; border-bottom: 2px solid var(--accent-light-blue); padding-bottom: 10px;">Resource Downloads</h3>
                <div class="download-grid">
                    <div class="glass-card download-card">
                        <i class="ph ph-file-pdf download-icon"></i>
                        <div class="download-info">
                            <h4>Course Syllabus</h4>
                            <p>Get the complete specialization-wise syllabus details.</p>
                            <a href="#" class="btn-download"><i class="ph ph-download-simple"></i> Download PDF</a>
                        </div>
                    </div>
                    <div class="glass-card download-card">
                        <i class="ph ph-file-pdf download-icon"></i>
                        <div class="download-info">
                            <h4>Fee Structure</h4>
                            <p>Detailed breakdown of academic fees & charges.</p>
                            <a href="#" class="btn-download"><i class="ph ph-download-simple"></i> Download PDF</a>
                        </div>
                    </div>
                    <div class="glass-card download-card">
                        <i class="ph ph-file-pdf download-icon"></i>
                        <div class="download-info">
                            <h4>Academic Calendar</h4>
                            <p>Yearly planner including holidays & exam schedules.</p>
                            <a href="#" class="btn-download"><i class="ph ph-download-simple"></i> Download PDF</a>
                        </div>
                    </div>
                </div>
            </div>
"@
Generate-Page -Filename "mtech.html" -Title "Master of Technology (M.Tech)" -Content $mtechContent

# 3. B.Pharma
$bpharmaContent = @"
            <img src="https://images.unsplash.com/photo-1576086213369-97a306d36557?auto=format&fit=crop&w=1200&q=80" class="course-banner" alt="B.Pharma Banner">
            
            <div class="grid-2" style="margin-bottom: 50px;">
                <div>
                    <h3 style="margin-bottom: 20px;">Program Overview</h3>
                    <p style="margin-bottom: 20px;">A comprehensive program covering pharmaceutical sciences, drug discovery, and healthcare management. Includes extensive laboratory work and clinical exposure.</p>
                    
                    <h4 style="margin-bottom: 10px;">Core Areas</h4>
                    <ul style="list-style-type: disc; margin-left: 20px; margin-bottom: 20px;">
                        <li>Pharmaceutics</li>
                        <li>Pharmacology</li>
                        <li>Pharmaceutical Chemistry</li>
                        <li>Pharmacognosy</li>
                    </ul>
                </div>
                <div class="glass-card">
                    <h3 style="margin-bottom: 20px; color: var(--primary);">Key Details</h3>
                    <p style="margin-bottom: 10px;"><strong>Duration:</strong> 4 Years (8 Semesters)</p>
                    <p style="margin-bottom: 10px;"><strong>Eligibility:</strong> 10+2 with PCB/PCM</p>
                    <p style="margin-bottom: 10px;"><strong>Fee Structure:</strong> INR 1,10,000 per annum</p>
                    <br>
                    <a href="admission.html" class="btn btn-primary" style="width: 100%; text-align: center;">Apply Now</a>
                </div>
            </div>

            <!-- Year Selection Tabs -->
            <h3 style="margin-bottom: 25px; text-align: center; border-bottom: 2px solid var(--accent-light-blue); padding-bottom: 10px;">Course Curriculum By Year</h3>
            <div class="year-tabs-container">
                <button class="year-tab active" data-year="1">1st Year</button>
                <button class="year-tab" data-year="2">2nd Year</button>
                <button class="year-tab" data-year="3">3rd Year</button>
                <button class="year-tab" data-year="4">4th Year</button>
            </div>

            <div class="year-contents-container" style="margin-bottom: 60px;">
                <!-- 1st Year -->
                <div class="year-content active glass-card" data-year="1">
                    <h4 style="margin-bottom: 15px; color: var(--primary);">1st Year (Semester I & II)</h4>
                    <div class="grid-2">
                        <div>
                            <h5 style="margin-bottom: 10px; font-weight: 600;">Semester I Core Courses</h5>
                            <ul style="list-style-type: square; margin-left: 20px;">
                                <li>Human Anatomy and Physiology I</li>
                                <li>Pharmaceutical Analysis I</li>
                                <li>Pharmaceutics I</li>
                                <li>Inorganic Chemistry</li>
                            </ul>
                        </div>
                        <div>
                            <h5 style="margin-bottom: 10px; font-weight: 600;">Semester II Core Courses</h5>
                            <ul style="list-style-type: square; margin-left: 20px;">
                                <li>Human Anatomy and Physiology II</li>
                                <li>Organic Chemistry I</li>
                                <li>Biochemistry</li>
                                <li>Pathophysiology</li>
                            </ul>
                        </div>
                    </div>
                </div>

                <!-- 2nd Year -->
                <div class="year-content glass-card" data-year="2">
                    <h4 style="margin-bottom: 15px; color: var(--primary);">2nd Year (Semester III & IV)</h4>
                    <div class="grid-2">
                        <div>
                            <h5 style="margin-bottom: 10px; font-weight: 600;">Semester III Core Courses</h5>
                            <ul style="list-style-type: square; margin-left: 20px;">
                                <li>Organic Chemistry II</li>
                                <li>Physical Pharmaceutics I</li>
                                <li>Pharmaceutical Microbiology</li>
                                <li>Pharmaceutical Engineering</li>
                            </ul>
                        </div>
                        <div>
                            <h5 style="margin-bottom: 10px; font-weight: 600;">Semester IV Core Courses</h5>
                            <ul style="list-style-type: square; margin-left: 20px;">
                                <li>Organic Chemistry III</li>
                                <li>Physical Pharmaceutics II</li>
                                <li>Pharmacology I</li>
                                <li>Pharmacognosy & Phytochemistry I</li>
                            </ul>
                        </div>
                    </div>
                </div>

                <!-- 3rd Year -->
                <div class="year-content glass-card" data-year="3">
                    <h4 style="margin-bottom: 15px; color: var(--primary);">3rd Year (Semester V & VI)</h4>
                    <div class="grid-2">
                        <div>
                            <h5 style="margin-bottom: 10px; font-weight: 600;">Semester V Core Courses</h5>
                            <ul style="list-style-type: square; margin-left: 20px;">
                                <li>Medicinal Chemistry I</li>
                                <li>Industrial Pharmacy I</li>
                                <li>Pharmacology II</li>
                                <li>Pharmacognosy & Phytochemistry II</li>
                            </ul>
                        </div>
                        <div>
                            <h5 style="margin-bottom: 10px; font-weight: 600;">Semester VI Core Courses</h5>
                            <ul style="list-style-type: square; margin-left: 20px;">
                                <li>Medicinal Chemistry II</li>
                                <li>Industrial Pharmacy II</li>
                                <li>Pharmacology III</li>
                                <li>Herbal Drug Technology</li>
                            </ul>
                        </div>
                    </div>
                </div>

                <!-- 4th Year -->
                <div class="year-content glass-card" data-year="4">
                    <h4 style="margin-bottom: 15px; color: var(--primary);">4th Year (Semester VII & VIII)</h4>
                    <div class="grid-2">
                        <div>
                            <h5 style="margin-bottom: 10px; font-weight: 600;">Semester VII Core Courses</h5>
                            <ul style="list-style-type: square; margin-left: 20px;">
                                <li>Instrumental Methods of Analysis</li>
                                <li>Industrial Pharmacy II</li>
                                <li>Novel Drug Delivery System</li>
                                <li>Practice School / Internship</li>
                            </ul>
                        </div>
                        <div>
                            <h5 style="margin-bottom: 10px; font-weight: 600;">Semester VIII Core Courses</h5>
                            <ul style="list-style-type: square; margin-left: 20px;">
                                <li>Biostatistics and Research Methodology</li>
                                <li>Social and Preventive Pharmacy</li>
                                <li>Major Project Work</li>
                                <li>Industrial Seminar</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Resource Downloads -->
            <div class="resources-section">
                <h3 style="margin-bottom: 25px; border-bottom: 2px solid var(--accent-light-blue); padding-bottom: 10px;">Resource Downloads</h3>
                <div class="download-grid">
                    <div class="glass-card download-card">
                        <i class="ph ph-file-pdf download-icon"></i>
                        <div class="download-info">
                            <h4>Course Syllabus</h4>
                            <p>Get the complete syllabus mandated by PCI.</p>
                            <a href="#" class="btn-download"><i class="ph ph-download-simple"></i> Download PDF</a>
                        </div>
                    </div>
                    <div class="glass-card download-card">
                        <i class="ph ph-file-pdf download-icon"></i>
                        <div class="download-info">
                            <h4>Fee Structure</h4>
                            <p>Detailed breakdown of academic fees & charges.</p>
                            <a href="#" class="btn-download"><i class="ph ph-download-simple"></i> Download PDF</a>
                        </div>
                    </div>
                    <div class="glass-card download-card">
                        <i class="ph ph-file-pdf download-icon"></i>
                        <div class="download-info">
                            <h4>Academic Calendar</h4>
                            <p>Yearly planner including holidays & exam schedules.</p>
                            <a href="#" class="btn-download"><i class="ph ph-download-simple"></i> Download PDF</a>
                        </div>
                    </div>
                </div>
            </div>
"@
Generate-Page -Filename "bpharma.html" -Title "Bachelor of Pharmacy (B.Pharma)" -Content $bpharmaContent

# 4. MBA
$mbaContent = @"
            <img src="https://images.unsplash.com/photo-1522071820081-009f0129c71c?auto=format&fit=crop&w=1200&q=80" class="course-banner" alt="MBA Banner">
            
            <div class="grid-2" style="margin-bottom: 50px;">
                <div>
                    <h3 style="margin-bottom: 20px;">Program Overview</h3>
                    <p style="margin-bottom: 20px;">Designed for future leaders, our MBA program combines rigorous business fundamentals with modern technological perspectives and leadership development.</p>
                    
                    <h4 style="margin-bottom: 10px;">Specializations</h4>
                    <ul style="list-style-type: disc; margin-left: 20px; margin-bottom: 20px;">
                        <li>Marketing Management</li>
                        <li>Financial Management</li>
                        <li>Human Resource Management</li>
                        <li>Information Technology Management</li>
                    </ul>
                </div>
                <div class="glass-card">
                    <h3 style="margin-bottom: 20px; color: var(--primary);">Key Details</h3>
                    <p style="margin-bottom: 10px;"><strong>Duration:</strong> 2 Years (4 Semesters)</p>
                    <p style="margin-bottom: 10px;"><strong>Eligibility:</strong> Graduation in any discipline with valid CAT/MAT score</p>
                    <p style="margin-bottom: 10px;"><strong>Fee Structure:</strong> INR 1,50,000 per annum</p>
                    <br>
                    <a href="admission.html" class="btn btn-primary" style="width: 100%; text-align: center;">Apply Now</a>
                </div>
            </div>

            <!-- Year Selection Tabs -->
            <h3 style="margin-bottom: 25px; text-align: center; border-bottom: 2px solid var(--accent-light-blue); padding-bottom: 10px;">Course Curriculum By Year</h3>
            <div class="year-tabs-container">
                <button class="year-tab active" data-year="1">1st Year</button>
                <button class="year-tab" data-year="2">2nd Year</button>
            </div>

            <div class="year-contents-container" style="margin-bottom: 60px;">
                <!-- 1st Year -->
                <div class="year-content active glass-card" data-year="1">
                    <h4 style="margin-bottom: 15px; color: var(--primary);">1st Year (Semester I & II)</h4>
                    <div class="grid-2">
                        <div>
                            <h5 style="margin-bottom: 10px; font-weight: 600;">Semester I Core Courses</h5>
                            <ul style="list-style-type: square; margin-left: 20px;">
                                <li>Management Concepts & Applications</li>
                                <li>Managerial Economics</li>
                                <li>Financial Accounting & Analysis</li>
                                <li>Organizational Behaviour</li>
                            </ul>
                        </div>
                        <div>
                            <h5 style="margin-bottom: 10px; font-weight: 600;">Semester II Core Courses</h5>
                            <ul style="list-style-type: square; margin-left: 20px;">
                                <li>Human Resource Management</li>
                                <li>Financial Management</li>
                                <li>Marketing Management</li>
                                <li>Business Research Methods</li>
                            </ul>
                        </div>
                    </div>
                </div>

                <!-- 2nd Year -->
                <div class="year-content glass-card" data-year="2">
                    <h4 style="margin-bottom: 15px; color: var(--primary);">2nd Year (Semester III & IV)</h4>
                    <div class="grid-2">
                        <div>
                            <h5 style="margin-bottom: 10px; font-weight: 600;">Semester III Core & Electives</h5>
                            <ul style="list-style-type: square; margin-left: 20px;">
                                <li>Strategic Management</li>
                                <li>Summer Training / Project Report</li>
                                <li>Dual Specialization Elective I & II</li>
                                <li>Digital Marketing Applications</li>
                            </ul>
                        </div>
                        <div>
                            <h5 style="margin-bottom: 10px; font-weight: 600;">Semester IV Core & Electives</h5>
                            <ul style="list-style-type: square; margin-left: 20px;">
                                <li>Corporate Governance & Ethics</li>
                                <li>Comprehensive Research Project</li>
                                <li>Dual Specialization Elective III & IV</li>
                                <li>Entrepreneurship Development</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Resource Downloads -->
            <div class="resources-section">
                <h3 style="margin-bottom: 25px; border-bottom: 2px solid var(--accent-light-blue); padding-bottom: 10px;">Resource Downloads</h3>
                <div class="download-grid">
                    <div class="glass-card download-card">
                        <i class="ph ph-file-pdf download-icon"></i>
                        <div class="download-info">
                            <h4>Course Syllabus</h4>
                            <p>Get the complete specialization-wise syllabus details.</p>
                            <a href="#" class="btn-download"><i class="ph ph-download-simple"></i> Download PDF</a>
                        </div>
                    </div>
                    <div class="glass-card download-card">
                        <i class="ph ph-file-pdf download-icon"></i>
                        <div class="download-info">
                            <h4>Fee Structure</h4>
                            <p>Detailed breakdown of academic fees & charges.</p>
                            <a href="#" class="btn-download"><i class="ph ph-download-simple"></i> Download PDF</a>
                        </div>
                    </div>
                    <div class="glass-card download-card">
                        <i class="ph ph-file-pdf download-icon"></i>
                        <div class="download-info">
                            <h4>Academic Calendar</h4>
                            <p>Yearly planner including holidays & exam schedules.</p>
                            <a href="#" class="btn-download"><i class="ph ph-download-simple"></i> Download PDF</a>
                        </div>
                    </div>
                </div>
            </div>
"@
Generate-Page -Filename "mba.html" -Title "Master of Business Administration (MBA)" -Content $mbaContent

# 5. Infrastructure
$infraContent = @"
            <div id="labs" style="margin-bottom: 60px;">
                <h2 style="border-bottom: 2px solid var(--accent-light-blue); padding-bottom: 10px; margin-bottom: 20px;">Advanced Laboratories</h2>
                <div class="grid-2">
                    <img src="https://images.unsplash.com/photo-1581091226825-a6a2a5aee158?auto=format&fit=crop&w=800&q=80" alt="Labs" style="border-radius: 12px; box-shadow: var(--glass-shadow);">
                    <div>
                        <p>Our campus houses over 40 specialized laboratories equipped with the latest technology to support both fundamental and applied research. From AI supercomputing clusters to advanced robotics testbeds, students have 24/7 access to world-class facilities.</p>
                    </div>
                </div>
            </div>

            <div id="equipments" style="margin-bottom: 60px;">
                <h2 style="border-bottom: 2px solid var(--accent-light-blue); padding-bottom: 10px; margin-bottom: 20px;">Research Equipments</h2>
                <div class="grid-3">
                    <div class="glass-card">
                        <h4>Electron Microscope</h4>
                        <p style="font-size: 0.9rem; margin-top: 10px;">State-of-the-art scanning electron microscope for nanotechnology research.</p>
                    </div>
                    <div class="glass-card">
                        <h4>CNC Machining Center</h4>
                        <p style="font-size: 0.9rem; margin-top: 10px;">Industrial-grade 5-axis CNC machine for advanced manufacturing prototypes.</p>
                    </div>
                    <div class="glass-card">
                        <h4>AI GPU Cluster</h4>
                        <p style="font-size: 0.9rem; margin-top: 10px;">High-performance computing cluster with NVIDIA A100 GPUs for deep learning.</p>
                    </div>
                </div>
            </div>

            <div id="library" style="margin-bottom: 60px;">
                <h2 style="border-bottom: 2px solid var(--accent-light-blue); padding-bottom: 10px; margin-bottom: 20px;">Central Library</h2>
                <p style="margin-bottom: 20px;">A fully automated, air-conditioned library spanning three floors with a collection of over 100,000 volumes, 500+ international journals, and access to major digital repositories like IEEE Xplore and SpringerLink.</p>
                <img src="https://images.unsplash.com/photo-1562774053-701939374585?auto=format&fit=crop&w=1200&q=80" alt="Library" style="border-radius: 12px; max-height: 400px; width: 100%; object-fit: cover; box-shadow: var(--glass-shadow);">
            </div>

            <div id="general" style="margin-bottom: 60px;">
                <h2 style="border-bottom: 2px solid var(--accent-light-blue); padding-bottom: 10px; margin-bottom: 20px;">General Infrastructure</h2>
                <ul style="list-style-type: none; display: flex; flex-direction: column; gap: 15px;">
                    <li><i class="ph ph-check-circle" style="color: var(--accent-light-blue);"></i> 1000-seater AC Auditorium</li>
                    <li><i class="ph ph-check-circle" style="color: var(--accent-light-blue);"></i> Modern Cafeteria and Food Court</li>
                    <li><i class="ph ph-check-circle" style="color: var(--accent-light-blue);"></i> Smart Classrooms with Interactive Boards</li>
                    <li><i class="ph ph-check-circle" style="color: var(--accent-light-blue);"></i> Campus-wide Wi-Fi (1 Gbps)</li>
                </ul>
            </div>

            <div id="tour" style="margin-bottom: 20px;">
                <h2 style="border-bottom: 2px solid var(--accent-light-blue); padding-bottom: 10px; margin-bottom: 20px;">Campus Tour</h2>
                <p>Welcome to our sprawling 50-acre green campus. Book a physical tour or explore our facilities virtually.</p>
                <br>
                <a href="contact.html" class="btn btn-outline" style="color: var(--primary); border-color: var(--primary);">Schedule a Visit</a>
            </div>
"@
Generate-Page -Filename "infrastructure.html" -Title "Campus Infrastructure" -Content $infraContent

# 6. Students Corner
$studentsContent = @"
            <div id="life" style="margin-bottom: 60px;">
                <h2 style="border-bottom: 2px solid var(--accent-light-blue); padding-bottom: 10px; margin-bottom: 20px;">Student's Life</h2>
                <p>Life at CAS is vibrant and full of opportunities. From technical clubs to cultural fests, students engage in diverse activities that foster holistic development. The campus provides a perfect blend of rigorous academics and extracurricular engagement.</p>
            </div>

            <div id="publication" style="margin-bottom: 60px;">
                <h2 style="border-bottom: 2px solid var(--accent-light-blue); padding-bottom: 10px; margin-bottom: 20px;">Student Publications</h2>
                <div class="grid-2">
                    <div class="glass-card">
                        <h4>The Technocrat (Annual Magazine)</h4>
                        <p style="font-size: 0.9rem; margin-top: 10px;">Showcasing the best technical articles, research abstracts, and creative writing by our students.</p>
                    </div>
                    <div class="glass-card">
                        <h4>CAS Research Digest</h4>
                        <p style="font-size: 0.9rem; margin-top: 10px;">A quarterly publication featuring ongoing student projects and innovations.</p>
                    </div>
                </div>
            </div>

            <div id="alumni" style="margin-bottom: 60px;">
                <h2 style="border-bottom: 2px solid var(--accent-light-blue); padding-bottom: 10px; margin-bottom: 20px;">Alumni Network</h2>
                <p>Our strong alumni network of 10,000+ graduates spans across the globe, working in top Fortune 500 companies and leading research institutions. We regularly host alumni meets and mentorship programs.</p>
            </div>

            <div id="gallery" style="margin-bottom: 20px;">
                <h2 style="border-bottom: 2px solid var(--accent-light-blue); padding-bottom: 10px; margin-bottom: 20px;">Innovation Gallery</h2>
                <div class="masonry-gallery">
                    <img src="https://images.unsplash.com/photo-1517245386807-bb43f82c33c4?auto=format&fit=crop&w=400&q=80" alt="Innovation 1" class="gallery-item">
                    <img src="https://images.unsplash.com/photo-1522071820081-009f0129c71c?auto=format&fit=crop&w=400&q=80" alt="Innovation 2" class="gallery-item">
                    <img src="https://images.unsplash.com/photo-1552664730-d307ca884978?auto=format&fit=crop&w=400&q=80" alt="Innovation 3" class="gallery-item">
                </div>
            </div>
"@
Generate-Page -Filename "students.html" -Title "Student's Corner" -Content $studentsContent

# 7. Admission
$admissionContent = @"
            <div class="grid-2">
                <div>
                    <h3 style="margin-bottom: 20px;">Admission Process</h3>
                    <p style="margin-bottom: 20px;">Welcome to the admissions portal. We seek bright, motivated students who are passionate about technology and innovation.</p>
                    
                    <h4 style="margin-bottom: 10px;">Steps to Apply:</h4>
                    <ol style="list-style-type: decimal; margin-left: 20px; margin-bottom: 20px;">
                        <li>Register online and generate application ID.</li>
                        <li>Fill the application form with personal and academic details.</li>
                        <li>Upload required documents (mark sheets, ID proof, photographs).</li>
                        <li>Pay the application fee online.</li>
                        <li>Submit the form and download the confirmation page.</li>
                    </ol>
                </div>
                <div class="glass-card">
                    <h3 style="margin-bottom: 20px; color: var(--primary);">Important Dates</h3>
                    <ul style="list-style-type: none; display: flex; flex-direction: column; gap: 15px;">
                        <li style="border-bottom: 1px solid rgba(0,0,0,0.1); padding-bottom: 10px;"><strong>Application Starts:</strong> April 1, 2026</li>
                        <li style="border-bottom: 1px solid rgba(0,0,0,0.1); padding-bottom: 10px;"><strong>Last Date to Apply:</strong> June 30, 2026</li>
                        <li style="border-bottom: 1px solid rgba(0,0,0,0.1); padding-bottom: 10px;"><strong>Entrance Exam:</strong> July 15, 2026</li>
                        <li><strong>Classes Commence:</strong> August 10, 2026</li>
                    </ul>
                    <br>
                    <a href="#" class="btn btn-primary" style="width: 100%; text-align: center;">Portal Closed</a>
                </div>
            </div>
"@
Generate-Page -Filename "admission.html" -Title "Admissions" -Content $admissionContent

# 8. About CAS
$aboutContent = @"
            <img src="https://images.unsplash.com/photo-1541339907198-e08756dedf3f?auto=format&fit=crop&w=1200&q=80" class="course-banner" alt="About Banner">
            
            <div id="overview" class="grid-2" style="margin-bottom: 50px;">
                <div style="grid-column: 1 / -1;">
                    <h3 style="margin-bottom: 20px;">Institute Overview</h3>
                    <p style="margin-bottom: 15px; line-height: 1.8;">Centre for Advanced Studies is an in-campus research driven institute established by Dr. A.P.J Abdul Kalam Technical University Lucknow to impart state of the art education to post graduate students and to facilitate quality research work in the emerging areas of Engineering and Technology. The institute offers M.Tech. and Ph.D programs in the disciplines of Computer Science and Engineering, Mechatronics, Nanotechnology, Manufacturing Technology and Automation, and Energy Science and Technology. Established by the Uttar Pradesh State Government in 2017 with an objective to provide a stimulating platform to research scholars and academicians for creating and disseminating research based knowledge and technologies for the development of State/Country. The Institute is climbing up consistently on the path to visibility across the globe. In a short span of time, significant progress has been made with quality education, impactful research, publications and patents, funded projects, training and placement. The University is also making constant efforts to create a healthy environment for meaningful research outcomes, to mentor affiliated Institutions with an establishment of world class laboratories and facilities in the Institute, and to enhance the knowledge of faculty and students with the latest technologies and developments through training and education.</p>
                    <p style="margin-bottom: 15px; line-height: 1.8;">The Technical University system has to be the main torch bearer of engineering education and research in the state. It is necessary to invest at the appropriate level for cultivating, on a sustainable basis, the ethos of engineering education and research. In view of this Dr. A.P.J. Abdul Kalam Technical University Uttar Pradesh (UP State Government Technical University formerly Uttar Pradesh Technical University) established the Centre for Advanced Studies on 7th July 2017 to upgrade the standards of academics, quality of staff and research focussing on societal importance in the state of Uttar Pradesh. The institute in its first phase began with one M.Tech. program in specialised areas of Cyber Security and Information and Communication Technologies (ICT). Later in the year 2018, two more programs were added namely M.Tech in Mechatronics and M.Tech in Nanotechnology. In another expansion, the institute started two more programs namely M.Tech in Manufacturing Technology & Automation and M.Tech in Energy Science & Technology. The institute envisages to start many other interdisciplinary courses and research in frontier areas such as Bio Technology, 3D printing, Climate control, Market and Business Analytics, Big Data to name a few.</p>
                </div>
            </div>

            <div id="mission" class="glass-card" style="margin-bottom: 60px;">
                <h3 style="margin-bottom: 20px; color: var(--primary);">Our Mission</h3>
                <p style="margin-bottom: 20px; font-size: 1.05rem; font-weight: 500;">To be recognized as a globally renowned Centre of Excellence by fostering quality education and cutting-edge research with transformative societal impact through innovation and interdisciplinary collaborations.</p>
                <ul style="list-style-type: none; display: flex; flex-direction: column; gap: 15px; font-size: 0.95rem;">
                    <li><i class="ph ph-check-circle" style="color: var(--accent-light-blue); margin-right: 10px;"></i> To provide a stimulating platform to research scholars and academicians in the Engineering & Technology domain, for creating and disseminating research-based knowledge/technologies for the development of society.</li>
                    <li><i class="ph ph-check-circle" style="color: var(--accent-light-blue); margin-right: 10px;"></i> To bring together creative, dedicated & innovative scholars engaged in Engineering and Technology academics and research.</li>
                    <li><i class="ph ph-check-circle" style="color: var(--accent-light-blue); margin-right: 10px;"></i> To impart state-of-the-art education leading to under-graduate and postgraduate students as well as to facilitate quality research work in the emerging areas of Engineering and Technology.</li>
                    <li><i class="ph ph-check-circle" style="color: var(--accent-light-blue); margin-right: 10px;"></i> To develop a culture that encourages risk-taking, entrepreneurship and flexibility and by embracing change in the interest of organizational effectiveness.</li>
                    <li><i class="ph ph-check-circle" style="color: var(--accent-light-blue); margin-right: 10px;"></i> To serve as a hub for skill development, knowledge dissemination, and empower researchers and students through workshops, conferences, and capacity-building initiatives in line with global standards.</li>
                </ul>
            </div>

            <div id="director" style="margin-bottom: 60px;">
                <h2 style="border-bottom: 2px solid var(--accent-light-blue); padding-bottom: 10px; margin-bottom: 30px;">Director's Message</h2>
                <div class="grid-2" style="align-items: center;">
                    <img src="https://images.unsplash.com/photo-1560250097-0b93528c311a?auto=format&fit=crop&w=600&q=80" alt="Director" style="border-radius: 12px; box-shadow: var(--glass-shadow);">
                    <div class="glass-card">
                        <p style="margin-bottom: 20px; font-style: italic; font-size: 1.1rem; line-height: 1.8;">"Welcome to the Centre for Advanced Studies. As the technical landscape evolves rapidly, our commitment to cutting-edge research and innovation remains steadfast. We take pride in our world-class infrastructure and our dynamic faculty who mentor students to solve real-world problems. Join us in our journey towards academic excellence and technological advancement."</p>
                        <h4 style="color: var(--primary);">- Prof. M. K. Dutta</h4>
                        <span style="font-size: 0.9rem; color: #64748b;">Director, CAS AKTU</span>
                    </div>
                </div>
            </div>
"@
Generate-Page -Filename "about.html" -Title "About CAS" -Content $aboutContent

# 9. Research
$researchContent = @"
            <img src="https://images.unsplash.com/photo-1581091226825-a6a2a5aee158?auto=format&fit=crop&w=1200&q=80" class="course-banner" alt="Research Banner">

            <div style="margin-bottom: 50px; text-align: center;">
                <p style="font-size: 1.1rem; max-width: 800px; margin: 0 auto; line-height: 1.8;">CAS targets impactful research and innovations across highly specialized domains. We are equipped with state-of-the-art laboratories like NVIDIA GPU-powered AI Labs, Cybercity Labs, and 3D Printing Centers, providing 24/7 access to researchers.</p>
            </div>

            <div id="domains" style="margin-bottom: 60px;">
                <h2 style="border-bottom: 2px solid var(--accent-light-blue); padding-bottom: 10px; margin-bottom: 30px;">Key Focus Areas</h2>
                <div class="grid-3">
                    <div class="glass-card">
                        <i class="ph ph-cpu" style="font-size: 2.5rem; color: var(--accent-light-blue); margin-bottom: 15px;"></i>
                        <h4 style="margin-bottom: 15px;">Computer Sc. & Engineering</h4>
                        <ul style="list-style-type: disc; margin-left: 20px; font-size: 0.9rem;">
                            <li>Artificial Intelligence (ML & DL)</li>
                            <li>Cyber Security & IoT</li>
                            <li>Data Science & Analytics</li>
                            <li>Computer Vision & Cloud</li>
                        </ul>
                    </div>
                    <div class="glass-card">
                        <i class="ph ph-robot" style="font-size: 2.5rem; color: var(--accent-light-blue); margin-bottom: 15px;"></i>
                        <h4 style="margin-bottom: 15px;">Mechatronics & Automation</h4>
                        <ul style="list-style-type: disc; margin-left: 20px; font-size: 0.9rem;">
                            <li>Robotics & Drones</li>
                            <li>PLC & SCADA</li>
                            <li>AI based systems</li>
                            <li>Industry 4.0</li>
                        </ul>
                    </div>
                    <div class="glass-card">
                        <i class="ph ph-atom" style="font-size: 2.5rem; color: var(--accent-light-blue); margin-bottom: 15px;"></i>
                        <h4 style="margin-bottom: 15px;">Nanotechnology & Energy</h4>
                        <ul style="list-style-type: disc; margin-left: 20px; font-size: 0.9rem;">
                            <li>Nanomaterial Synthesis</li>
                            <li>MEMS/NEMS Devices</li>
                            <li>Renewable Energy</li>
                            <li>Energy Storage Systems</li>
                        </ul>
                    </div>
                </div>
            </div>

            <div style="margin-bottom: 60px;">
                <h2 style="border-bottom: 2px solid var(--accent-light-blue); padding-bottom: 10px; margin-bottom: 30px;">Funded Projects & Seminars</h2>
                <div class="grid-2">
                    <div>
                        <img src="https://images.unsplash.com/photo-1532094349884-543bc11b234d?auto=format&fit=crop&w=800&q=80" style="border-radius: 12px; box-shadow: var(--glass-shadow); margin-bottom: 20px;">
                        <p style="line-height: 1.8;">Our faculty and students actively participate in government and industry-funded projects, driving innovation in healthcare tech, smart agriculture, and sustainable energy.</p>
                    </div>
                    <div class="glass-card">
                        <h3 style="margin-bottom: 20px; color: var(--primary);">Research Environment</h3>
                        <ul style="list-style-type: none; display: flex; flex-direction: column; gap: 15px;">
                            <li><i class="ph ph-check-circle" style="color: var(--accent-light-blue);"></i> Cash prizes for SCI indexed journal publications</li>
                            <li><i class="ph ph-check-circle" style="color: var(--accent-light-blue);"></i> Financial support for conferences and workshops</li>
                            <li><i class="ph ph-check-circle" style="color: var(--accent-light-blue);"></i> Global MoUs for collaborative research</li>
                            <li><i class="ph ph-check-circle" style="color: var(--accent-light-blue);"></i> Access to Elsevier, Springer, John Wiley e-resources</li>
                        </ul>
                    </div>
                </div>
            </div>
"@
Generate-Page -Filename "research.html" -Title "Research & Innovation" -Content $researchContent

# 10. Publications
$publicationsContent = @"
            <div style="margin-bottom: 40px; text-align: center;">
                <p style="font-size: 1.1rem; max-width: 800px; margin: 0 auto;">Our scholars consistently publish high-quality research articles in impactful SCI/Scopus indexed journals and top-tier conferences.</p>
            </div>

            <h2 style="border-bottom: 2px solid var(--accent-light-blue); padding-bottom: 10px; margin-bottom: 30px;">Highlighted Publications (SCI Indexed)</h2>
            <div style="display: flex; flex-direction: column; gap: 20px; margin-bottom: 60px;">
                <div class="glass-card" style="display: flex; gap: 20px; align-items: flex-start;">
                    <i class="ph ph-article" style="font-size: 2rem; color: var(--primary);"></i>
                    <div>
                        <h4 style="margin-bottom: 10px;">AI-CardioCare: Artificial Intelligence based Device for Cardiac Health Monitoring</h4>
                        <p style="font-size: 0.9rem; color: #64748b; margin-bottom: 5px;">R. C. Joshi, J. S. Khan, M. K. Dutta | IEEE Transactions on Human-Machine Systems</p>
                        <span style="font-size: 0.8rem; background: var(--primary); color: white; padding: 3px 8px; border-radius: 4px;">Impact Factor: 4.602</span>
                    </div>
                </div>
                <div class="glass-card" style="display: flex; gap: 20px; align-items: flex-start;">
                    <i class="ph ph-article" style="font-size: 2rem; color: var(--primary);"></i>
                    <div>
                        <h4 style="margin-bottom: 10px;">VisionCervix: Papanicolaou Cervical Smears Classification Using CNN-Vision</h4>
                        <p style="font-size: 0.9rem; color: #64748b; margin-bottom: 5px;">R. Maurya, N. Pandey, M. K. Dutta | Biomedical Signal Processing and Control (Elsevier)</p>
                        <span style="font-size: 0.8rem; background: var(--primary); color: white; padding: 3px 8px; border-radius: 4px;">Impact Factor: 5.076</span>
                    </div>
                </div>
                <div class="glass-card" style="display: flex; gap: 20px; align-items: flex-start;">
                    <i class="ph ph-article" style="font-size: 2rem; color: var(--primary);"></i>
                    <div>
                        <h4 style="margin-bottom: 10px;">Optimization of Ascorbic Acid for Enhanced Electrocatalytic Activity</h4>
                        <p style="font-size: 0.9rem; color: #64748b; margin-bottom: 5px;">M. Gyanprakash, C.K. Rastogi, et al. | Energy & Fuels</p>
                        <span style="font-size: 0.8rem; background: var(--primary); color: white; padding: 3px 8px; border-radius: 4px;">Impact Factor: 4.6</span>
                    </div>
                </div>
            </div>

            <h2 style="border-bottom: 2px solid var(--accent-light-blue); padding-bottom: 10px; margin-bottom: 30px;">Recent Patents</h2>
            <div class="grid-2" style="margin-bottom: 50px;">
                <div class="glass-card">
                    <h4 style="margin-bottom: 10px;">Multi-Mode Real-time Object Detector for VIP</h4>
                    <p style="font-size: 0.9rem; margin-bottom: 10px;">An obstacle aware assistive system for Visually Impaired Persons (VIP).</p>
                    <p style="font-size: 0.85rem; color: #64748b;">Inventors: M.K. Dutta, R. C. Joshi, S. Yadav</p>
                </div>
                <div class="glass-card">
                    <h4 style="margin-bottom: 10px;">Machine Learning for Cardiac Abnormality</h4>
                    <p style="font-size: 0.9rem; margin-bottom: 10px;">System and method for automatic detection of abnormality from cardiac sound.</p>
                    <p style="font-size: 0.85rem; color: #64748b;">Inventors: M.K. Dutta, A. Yadav, A. Kaushal</p>
                </div>
            </div>
"@
Generate-Page -Filename "publications.html" -Title "Publications & Patents" -Content $publicationsContent

# 11. Alumni
$alumniContent = @"
            <div class="grid-2" style="margin-bottom: 60px;">
                <div>
                    <img src="https://images.unsplash.com/photo-1523240795612-9a054b0db644?auto=format&fit=crop&w=800&q=80" style="border-radius: 12px; box-shadow: var(--glass-shadow);">
                </div>
                <div>
                    <h2 style="border-bottom: 2px solid var(--accent-light-blue); padding-bottom: 10px; margin-bottom: 20px;">Our Alumni Network</h2>
                    <p style="margin-bottom: 15px; line-height: 1.8;">CAS takes immense pride in its alumni who have established themselves as leaders, innovators, and researchers worldwide. The Alumni Cell acts as a bridge between the institute and its graduates, fostering continuous engagement and mentorship.</p>
                    <a href="#" class="btn btn-primary" style="margin-top: 10px;">Join Alumni Portal</a>
                </div>
            </div>

            <h2 style="border-bottom: 2px solid var(--accent-light-blue); padding-bottom: 10px; margin-bottom: 30px; text-align: center;">Featured Alumni Profiles</h2>
            <div class="grid-3" style="margin-bottom: 50px;">
                <div class="glass-card" style="text-align: center;">
                    <img src="https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?auto=format&fit=crop&w=150&q=80" style="border-radius: 50%; margin-bottom: 15px; width: 100px; height: 100px; object-fit: cover;">
                    <h4 style="margin-bottom: 5px;">Dr. Abhinav Sharma</h4>
                    <p style="color: var(--primary); font-size: 0.9rem; margin-bottom: 10px;">M.Tech (2019) | AI Scientist, Google</p>
                    <p style="font-size: 0.85rem;">Pioneering research in predictive modeling and natural language processing.</p>
                </div>
                <div class="glass-card" style="text-align: center;">
                    <img src="https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?auto=format&fit=crop&w=150&q=80" style="border-radius: 50%; margin-bottom: 15px; width: 100px; height: 100px; object-fit: cover;">
                    <h4 style="margin-bottom: 5px;">Neha Gupta</h4>
                    <p style="color: var(--primary); font-size: 0.9rem; margin-bottom: 10px;">MBA (2020) | Strategy Consultant</p>
                    <p style="font-size: 0.85rem;">Leading technology integration strategies for Fortune 500 companies.</p>
                </div>
                <div class="glass-card" style="text-align: center;">
                    <img src="https://images.unsplash.com/photo-1599566150163-29194dcaad36?auto=format&fit=crop&w=150&q=80" style="border-radius: 50%; margin-bottom: 15px; width: 100px; height: 100px; object-fit: cover;">
                    <h4 style="margin-bottom: 5px;">Vikram Singh</h4>
                    <p style="color: var(--primary); font-size: 0.9rem; margin-bottom: 10px;">B.Tech (2021) | Founder, NanoTech Solutions</p>
                    <p style="font-size: 0.85rem;">Recognized as a top emerging entrepreneur in the renewable energy sector.</p>
                </div>
            </div>
"@
Generate-Page -Filename "alumni.html" -Title "Alumni Network" -Content $alumniContent

# 12. Activities
$activitiesContent = @"
            <div style="margin-bottom: 50px; text-align: center;">
                <p style="font-size: 1.1rem; max-width: 800px; margin: 0 auto; line-height: 1.8;">Beyond academics, CAS offers a vibrant campus life filled with technical symposia, cultural festivals, sports meets, and social outreach programs.</p>
            </div>

            <div class="grid-2" style="margin-bottom: 60px;">
                <div class="glass-card">
                    <h3 style="margin-bottom: 15px; color: var(--primary);"><i class="ph ph-cpu"></i> Technical Activities</h3>
                    <p style="margin-bottom: 15px;">Regular hackathons, coding contests, and robotics competitions designed to sharpen technical acumen. Our tech-clubs partner with industry leaders to host interactive sessions.</p>
                    <ul style="list-style-type: disc; margin-left: 20px; font-size: 0.9rem;">
                        <li>Annual Tech Fest "Innovision"</li>
                        <li>AI & IoT Hackathons</li>
                        <li>Coding Club Workshops</li>
                    </ul>
                </div>
                <div class="glass-card">
                    <h3 style="margin-bottom: 15px; color: var(--primary);"><i class="ph ph-mask-happy"></i> Cultural & Sports</h3>
                    <p style="margin-bottom: 15px;">We believe in holistic development. The annual cultural fest and inter-college sports tournaments provide a platform for students to showcase their talents.</p>
                    <ul style="list-style-type: disc; margin-left: 20px; font-size: 0.9rem;">
                        <li>Cultural Fest "Spandan"</li>
                        <li>Inter-branch Cricket & Football Leagues</li>
                        <li>Art & Photography Exhibitions</li>
                    </ul>
                </div>
            </div>

            <h2 style="border-bottom: 2px solid var(--accent-light-blue); padding-bottom: 10px; margin-bottom: 30px;">Activity Gallery</h2>
            <div class="masonry-gallery">
                <img src="https://images.unsplash.com/photo-1540575467063-178a50c2df87?auto=format&fit=crop&w=400&q=80" alt="Activity 1" class="gallery-item">
                <img src="https://images.unsplash.com/photo-1511512578047-dfb367046420?auto=format&fit=crop&w=400&q=80" alt="Activity 2" class="gallery-item">
                <img src="https://images.unsplash.com/photo-1492684223066-81342ee5ff30?auto=format&fit=crop&w=400&q=80" alt="Activity 3" class="gallery-item">
                <img src="https://images.unsplash.com/photo-1517245386807-bb43f82c33c4?auto=format&fit=crop&w=400&q=80" alt="Activity 4" class="gallery-item">
            </div>
"@
Generate-Page -Filename "activities.html" -Title "Student Activities" -Content $activitiesContent

# 13. 75 AKAM
$akamContent = @"
            <img src="https://images.unsplash.com/photo-1532375810579-7c4d528f8f2b?auto=format&fit=crop&w=1200&q=80" class="course-banner" alt="AKAM Banner">

            <div style="margin-bottom: 50px; text-align: center;">
                <h2 style="color: var(--primary); margin-bottom: 20px;">Azadi Ka Amrit Mahotsav</h2>
                <p style="font-size: 1.1rem; max-width: 800px; margin: 0 auto; line-height: 1.8;">An initiative of the Government of India to celebrate and commemorate 75 years of progressive India and the glorious history of its people, culture, and achievements. CAS proudly joins this monumental celebration.</p>
            </div>

            <div class="grid-3" style="margin-bottom: 50px;">
                <div class="glass-card text-center">
                    <h3 style="margin-bottom: 10px; font-size: 1.2rem;">Flag Hoisting Ceremony</h3>
                    <p style="font-size: 0.9rem; margin-bottom: 15px;">A grand campus assembly honoring our national heroes.</p>
                    <img src="https://images.unsplash.com/photo-1532375810579-7c4d528f8f2b?auto=format&fit=crop&w=300&q=80" style="border-radius: 8px; width: 100%;">
                </div>
                <div class="glass-card text-center">
                    <h3 style="margin-bottom: 10px; font-size: 1.2rem;">Heritage Walk</h3>
                    <p style="font-size: 0.9rem; margin-bottom: 15px;">Students exploring local historical monuments.</p>
                    <img src="https://images.unsplash.com/photo-1523240795612-9a054b0db644?auto=format&fit=crop&w=300&q=80" style="border-radius: 8px; width: 100%;">
                </div>
                <div class="glass-card text-center">
                    <h3 style="margin-bottom: 10px; font-size: 1.2rem;">Innovation Exhibition</h3>
                    <p style="font-size: 0.9rem; margin-bottom: 15px;">Showcasing 75 student innovations for self-reliant India.</p>
                    <img src="https://images.unsplash.com/photo-1581091226825-a6a2a5aee158?auto=format&fit=crop&w=300&q=80" style="border-radius: 8px; width: 100%;">
                </div>
            </div>
"@
Generate-Page -Filename "akam.html" -Title "Azadi Ka Amrit Mahotsav" -Content $akamContent

# 14. Events (Workshops & Webinars)
$eventsContent = @"
            <div style="margin-bottom: 50px; text-align: center;">
                <p style="font-size: 1.1rem; max-width: 800px; margin: 0 auto; line-height: 1.8;">CAS regularly organizes specialized workshops, expert webinars, and international conferences to keep our community updated with the latest technological trends.</p>
            </div>

            <h2 style="border-bottom: 2px solid var(--accent-light-blue); padding-bottom: 10px; margin-bottom: 30px;">Upcoming & Past Workshops</h2>
            <div class="grid-2" style="margin-bottom: 50px;">
                <div class="glass-card">
                    <span style="background: var(--accent-light-blue); color: white; padding: 4px 10px; border-radius: 4px; font-size: 0.8rem; font-weight: bold;">Upcoming</span>
                    <h3 style="margin-top: 15px; margin-bottom: 10px;">Hands-on Training on NVIDIA Jetson for Edge AI</h3>
                    <p style="font-size: 0.9rem; color: #64748b; margin-bottom: 10px;"><i class="ph ph-calendar"></i> April 20-22, 2026</p>
                    <p style="margin-bottom: 15px; font-size: 0.95rem;">An intensive 3-day workshop focusing on deploying AI models on edge devices.</p>
                    <a href="#" class="btn btn-outline" style="padding: 5px 15px; font-size: 0.9rem;">Register Now</a>
                </div>
                <div class="glass-card">
                    <span style="background: #64748b; color: white; padding: 4px 10px; border-radius: 4px; font-size: 0.8rem; font-weight: bold;">Completed</span>
                    <h3 style="margin-top: 15px; margin-bottom: 10px;">Advanced Cybersecurity and Ethical Hacking</h3>
                    <p style="font-size: 0.9rem; color: #64748b; margin-bottom: 10px;"><i class="ph ph-calendar"></i> Feb 10-12, 2026</p>
                    <p style="margin-bottom: 15px; font-size: 0.95rem;">Covered network penetration testing and vulnerability assessment.</p>
                    <a href="#" class="btn btn-outline" style="padding: 5px 15px; font-size: 0.9rem;">View Report</a>
                </div>
            </div>

            <h2 style="border-bottom: 2px solid var(--accent-light-blue); padding-bottom: 10px; margin-bottom: 30px;">Webinar Archives</h2>
            <div class="grid-3" style="margin-bottom: 50px;">
                <div class="glass-card">
                    <h4 style="margin-bottom: 10px;">Future of Quantum Computing</h4>
                    <p style="font-size: 0.85rem; color: #64748b; margin-bottom: 10px;">Speaker: Dr. Richard Feynman (Virtual)</p>
                    <a href="#" style="color: var(--primary); font-weight: bold; font-size: 0.9rem;">Watch Recording <i class="ph ph-play-circle"></i></a>
                </div>
                <div class="glass-card">
                    <h4 style="margin-bottom: 10px;">Nanomaterials in Healthcare</h4>
                    <p style="font-size: 0.85rem; color: #64748b; margin-bottom: 10px;">Speaker: Prof. A. Kumar</p>
                    <a href="#" style="color: var(--primary); font-weight: bold; font-size: 0.9rem;">Watch Recording <i class="ph ph-play-circle"></i></a>
                </div>
                <div class="glass-card">
                    <h4 style="margin-bottom: 10px;">Industry 4.0 Integration</h4>
                    <p style="font-size: 0.85rem; color: #64748b; margin-bottom: 10px;">Speaker: Er. S. Das, Siemens</p>
                    <a href="#" style="color: var(--primary); font-weight: bold; font-size: 0.9rem;">Watch Recording <i class="ph ph-play-circle"></i></a>
                </div>
            </div>
"@
Generate-Page -Filename "events.html" -Title "Workshops & Webinars" -Content $eventsContent

# 15. Faculty
$facultyContent = Get-Content -Path "faculty_content.txt" -Raw -Encoding UTF8
Generate-Page -Filename "faculty.html" -Title "Faculty Directory" -Content $facultyContent

Write-Host "All pages generated successfully."
