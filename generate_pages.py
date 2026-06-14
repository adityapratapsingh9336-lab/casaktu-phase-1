import os
import re

with open('index.html', 'r', encoding='utf-8') as f:
    index_content = f.read()

# Extract top part (up to the end of the navbar)
top_match = re.search(r'(?s)(<!DOCTYPE html>.*?</nav>)', index_content)
top_html = top_match.group(1) if top_match else ""

# Extract bottom part (from footer to the end)
bottom_match = re.search(r'(?s)(<!-- Footer -->.*</html>)', index_content)
bottom_html = bottom_match.group(1) if bottom_match else ""

def generate_page(filename, title, content):
    full_html = f"""{top_html}

    <!-- Page Header -->
    <section class="page-header">
        <div class="container">
            <h1>{title}</h1>
        </div>
    </section>

    <!-- Main Content -->
    <section>
        <div class="container reveal-up">
{content}
        </div>
    </section>

{bottom_html}"""
    with open(filename, 'w', encoding='utf-8') as f:
        f.write(full_html)

# 1. B.Tech
generate_page('btech.html', 'Bachelor of Technology (B.Tech)', '''
            <div class="grid-2">
                <div>
                    <h3 style="margin-bottom: 20px;">Program Overview</h3>
                    <p style="margin-bottom: 20px;">Our B.Tech program is designed to provide students with a strong foundation in engineering principles and hands-on practical experience. The curriculum is constantly updated to meet industry demands.</p>
                    
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
                    <p><strong>Duration:</strong> 4 Years (8 Semesters)</p>
                    <p><strong>Eligibility:</strong> 10+2 with PCM (Minimum 60%)</p>
                    <p><strong>Fee Structure:</strong> INR 1,20,000 per annum</p>
                    <br>
                    <a href="admission.html" class="btn btn-primary">Apply Now</a>
                </div>
            </div>
''')

# 2. M.Tech
generate_page('mtech.html', 'Master of Technology (M.Tech)', '''
            <div class="grid-2">
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
                    <p><strong>Duration:</strong> 2 Years (4 Semesters)</p>
                    <p><strong>Eligibility:</strong> B.Tech/B.E. in relevant field with valid GATE score</p>
                    <p><strong>Fee Structure:</strong> INR 90,000 per annum</p>
                    <br>
                    <a href="admission.html" class="btn btn-primary">Apply Now</a>
                </div>
            </div>
''')

# 3. B.Pharma
generate_page('bpharma.html', 'Bachelor of Pharmacy (B.Pharma)', '''
            <div class="grid-2">
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
                    <p><strong>Duration:</strong> 4 Years (8 Semesters)</p>
                    <p><strong>Eligibility:</strong> 10+2 with PCB/PCM</p>
                    <p><strong>Fee Structure:</strong> INR 1,10,000 per annum</p>
                    <br>
                    <a href="admission.html" class="btn btn-primary">Apply Now</a>
                </div>
            </div>
''')

# 4. MBA
generate_page('mba.html', 'Master of Business Administration (MBA)', '''
            <div class="grid-2">
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
                    <p><strong>Duration:</strong> 2 Years (4 Semesters)</p>
                    <p><strong>Eligibility:</strong> Graduation in any discipline with valid CAT/MAT score</p>
                    <p><strong>Fee Structure:</strong> INR 1,50,000 per annum</p>
                    <br>
                    <a href="admission.html" class="btn btn-primary">Apply Now</a>
                </div>
            </div>
''')

# 5. Infrastructure
generate_page('infrastructure.html', 'Campus Infrastructure', '''
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
''')

# 6. Students Corner
generate_page('students.html', 'Student\\'s Corner', '''
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
''')

# 7. Admission
generate_page('admission.html', 'Admissions', '''
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
''')

print("Generated new pages.")
