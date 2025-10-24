#!/usr/bin/env python3
"""
Analyze the ggplot2 workshop transcript and extract key topics
"""

import re
from collections import Counter

# Read the VTT file
with open('pedersen_ggplot2_workshop.en.vtt', 'r', encoding='utf-8') as f:
    lines = f.readlines()

# Parse VTT and extract unique text segments
text_segments = []
i = 0
while i < len(lines):
    line = lines[i].strip()
    
    # Look for timestamp lines
    if '-->' in line:
        # Next line should be the text
        if i + 1 < len(lines):
            text_line = lines[i + 1].strip()
            # Remove timing tags
            clean_text = re.sub(r'<[^>]+>', ' ', text_line)
            # Remove align/position attributes
            clean_text = re.sub(r'\s+', ' ', clean_text).strip()
            if clean_text and not clean_text.startswith('align:'):
                text_segments.append(clean_text)
    i += 1

# Join segments and clean up
full_text = ' '.join(text_segments)

# Remove excessive whitespace
full_text = re.sub(r'\s+', ' ', full_text).strip()

# Save clean transcript
with open('pedersen_transcript_cleaned.txt', 'w', encoding='utf-8') as f:
    f.write(full_text)

print(f"✓ Cleaned transcript saved ({len(full_text)} characters)")
print(f"✓ Total text segments: {len(text_segments)}")
print("\n" + "="*80)
print("SAMPLE OF TRANSCRIPT (first 1000 chars):")
print("="*80)
print(full_text[:1000])
print("\n" + "="*80)
