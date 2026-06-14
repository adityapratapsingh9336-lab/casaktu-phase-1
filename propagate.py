import os
import re

html_files = [f for f in os.listdir('.') if f.endswith('.html') and f != 'index.html']

# Read the new header and footer from index.html
with open('index.html', 'r', encoding='utf-8') as f:
    index_content = f.read()

# Extract header
header_match = re.search(r'<!-- Institutional Header -->(.*?)<!-- Navigation Bar -->', index_content, re.DOTALL)
new_header = header_match.group(0).strip() if header_match else None

# Extract footer
footer_match = re.search(r'<!-- Footer -->(.*?)<script src="js/script.js"></script>', index_content, re.DOTALL)
new_footer = footer_match.group(0).strip() if footer_match else None

if not new_header or not new_footer:
    print("Could not extract header or footer from index.html")
    exit(1)

for file in html_files:
    with open(file, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Replace header
    content = re.sub(r'<!-- Institutional Header -->.*?<!-- Navigation Bar -->', new_header + '\n\n    <!-- Navigation Bar -->', content, flags=re.DOTALL)
    
    # Replace footer
    content = re.sub(r'<!-- Footer -->.*?<script src="js/script.js"></script>', new_footer + '\n\n    <script src="js/script.js"></script>', content, flags=re.DOTALL)
    
    with open(file, 'w', encoding='utf-8') as f:
        f.write(content)
        
print("Propagation complete.")
