import json
import sys

# Import the content dictionary
from asia_content_full import ASIA_CONTENT

# Read the current animals.json
with open('animals.json', 'r') as f:
    data = json.load(f)

# Track which animals were updated
updated_animals = []
skipped_animals = []
not_found = []

# Update each Asia animal
for animal in data['animals']:
    if animal['continent'] != 'Asia':
        continue
    
    slug = animal['slug']
    
    # Check if animal already has content
    if len(animal.get('description', '')) > 50:
        skipped_animals.append(animal['name'])
        continue
    
    # Check if we have content for this animal
    if slug in ASIA_CONTENT:
        content = ASIA_CONTENT[slug]
        animal['description'] = content['desc']
        animal['highlights'] = content['high']
        animal['conservation'] = content['cons']
        updated_animals.append(animal['name'])
    else:
        not_found.append(animal['name'])

# Write updated animals.json
with open('animals.json', 'w') as f:
    json.dump(data, f, indent=2)

# Print summary
print("=" * 60)
print("ASIA ANIMALS CONTENT UPDATE SUMMARY")
print("=" * 60)
print(f"\nTotal Asia animals updated: {len(updated_animals)}")
print(f"Already had content (skipped): {len(skipped_animals)}")
print(f"No content available: {len(not_found)}")

if updated_animals:
    print(f"\n--- ANIMALS UPDATED ({len(updated_animals)}) ---")
    for name in sorted(updated_animals):
        print(f"  ✓ {name}")

if skipped_animals:
    print(f"\n--- ALREADY HAD CONTENT ({len(skipped_animals)}) ---")
    for name in sorted(skipped_animals):
        print(f"  → {name}")

if not_found:
    print(f"\n--- NO CONTENT AVAILABLE ({len(not_found)}) ---")
    for name in sorted(not_found):
        print(f"  ✗ {name}")

print("\n" + "=" * 60)
print("animals.json has been updated successfully!")
print("=" * 60)
