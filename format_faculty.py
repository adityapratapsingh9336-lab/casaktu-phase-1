import re

with open("raw_faculty.txt", "r", encoding="utf-8") as f:
    lines = f.read().split('\n')

blocks = []
current_block = []

for line in lines:
    if line.startswith("Dr. ") or line.startswith("Mr.") or line.startswith("DR. "):
        if current_block:
            blocks.append(current_block)
        current_block = [line]
    elif current_block:
        current_block.append(line)
if current_block:
    blocks.append(current_block)

html = """
            <img src="https://images.unsplash.com/photo-1524178232363-1fb2b075b655?auto=format&fit=crop&w=1200&q=80" class="course-banner" alt="Faculty Banner">
            
            <div style="margin-bottom: 50px; text-align: center;">
                <p style="font-size: 1.1rem; max-width: 800px; margin: 0 auto; line-height: 1.8;">Our distinguished faculty members are renowned researchers and academicians dedicated to fostering innovation and excellence in engineering and technology.</p>
            </div>

            <div class="faculty-grid" style="display: grid; grid-template-columns: 1fr; gap: 40px; margin-bottom: 60px;">
"""

for block in blocks:
    name = block[0].strip()
    
    # We will separate the block into 'sidebar' and 'bio'
    # Bio is usually the very long paragraphs at the end.
    
    sidebar_lines = []
    bio_lines = []
    
    for line in block[1:]:
        line = line.strip()
        if not line:
            continue
        
        # If the line is very long, it's likely a bio paragraph
        if len(line) > 200:
            bio_lines.append(line)
        else:
            sidebar_lines.append(line)
            
    # Process sidebar lines to look nicer
    sidebar_html = ""
    in_list = False
    for sl in sidebar_lines:
        if sl.startswith("-") or sl.startswith("•"):
            sidebar_html += f'<div style="margin-bottom: 8px; padding-left: 15px; text-indent: -15px;">&#8226; {sl[1:].strip()}</div>'
        elif sl.lower() == "click here for:":
            sidebar_html += f'<strong style="color: var(--accent-light-blue); display: block; margin-top: 15px; margin-bottom: 5px;">Links</strong>'
        elif "area of interest" in sl.lower():
            sidebar_html += f'<strong style="color: var(--accent-light-blue); display: block; margin-top: 15px; margin-bottom: 5px;">Area of Interest</strong>'
        else:
            # Check if it's a link text like "Google Scholar"
            if any(x in sl.lower() for x in ["scholar", "research gate", "orcid", "publication", "home page"]):
                sidebar_html += f'<a href="#" style="display: block; color: var(--primary); margin-bottom: 5px; text-decoration: none;">{sl} &rarr;</a>'
            else:
                sidebar_html += f'<div style="margin-bottom: 8px; font-weight: 500;">{sl}</div>'
                
    bio_html = ""
    for bl in bio_lines:
        bio_html += f'<p style="margin-bottom: 15px; font-size: 0.95rem; line-height: 1.7; color: var(--text-dark);">{bl}</p>'
        
    # If bio is empty but there's a long sidebar line (missed classification), we can move it
    
    card = f'''
                <div class="glass-card" style="padding: 30px;">
                    <h3 style="color: var(--primary); border-bottom: 1px solid rgba(255,255,255,0.1); padding-bottom: 15px; margin-bottom: 25px; font-size: 1.5rem;">{name}</h3>
                    <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 40px;">
                        <div class="faculty-details" style="font-size: 0.9rem; color: #cbd5e1;">
                            {sidebar_html}
                        </div>
                        <div class="faculty-bio">
                            {bio_html}
                        </div>
                    </div>
                </div>
    '''
    html += card

html += "            </div>\n"

with open("faculty_content.txt", "w", encoding="utf-8") as f:
    f.write(html)
