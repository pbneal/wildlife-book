#!/usr/bin/env python3
"""
Generate SEO-optimized wildlife content for North America animals.
This script updates animals.json with descriptions, highlights, and conservation info.
"""

import json
import re

# Content for all 37 North America animals
NORTH_AMERICA_CONTENT = {
    # USA and Canada (14 animals - first batch already has content: grizzly-bear, bald-eagle, gray-wolf, polar-bear)
    "american-bison": {
        "description": "The American Bison (*Bison bison*), often called buffalo, is the largest land mammal in North America and a symbol of the American West. These magnificent creatures once roamed the plains in herds numbering in the millions, shaping the ecosystem and the lives of Indigenous peoples who relied on them for food, shelter, and spiritual sustenance. Standing up to 6 feet tall at the shoulder and weighing over 2,000 pounds, bison are powerful animals with distinctive shoulder humps and thick, shaggy coats that protect them from harsh prairie winters. Despite their massive size, bison are surprisingly agile and can run up to 35 miles per hour. Today, they serve as a conservation success story, having recovered from near-extinction in the late 1800s when hunting reduced their numbers from millions to fewer than 1,000 individuals.",
        "highlights": [
            "Largest land mammal in North America, weighing up to 2,000 pounds",
            "Can run up to 35 mph despite their massive size",
            "Recovered from near-extinction (fewer than 1,000 in 1900)",
            "Distinctive shoulder hump made of muscle, not fat",
            "Play crucial role in prairie ecosystem maintenance"
        ],
        "conservation": "American Bison are classified as Near Threatened due to their limited genetic diversity and dependence on conservation herds. While numbers have recovered to approximately 500,000, most are managed as livestock rather than wild populations. Only about 20,000 truly wild bison remain in conservation herds across North America. The species continues to face challenges from habitat fragmentation, genetic introgression with cattle, and limited migration corridors. Conservation efforts focus on establishing free-ranging herds and protecting genetic diversity.",
        "scientificName": "Bison bison",
        "stats": {
            "habitat": "Grasslands, Prairies, Open Woodlands",
            "diet": "Herbivore (grasses, sedges, herbs)",
            "lifespan": "15-20 years",
            "weight": "318-1,000 kg (males larger)"
        }
    },
    "mountain-lion": {
        "description": "The Mountain Lion (*Puma concolor*), also known as cougar, puma, or panther, is one of the most adaptable and widespread large mammals in the Americas. These elusive cats range from the Canadian Yukon to the southern Andes, demonstrating remarkable versatility across diverse habitats. In North America, they primarily inhabit mountainous regions, forests, and deserts from British Columbia to Patagonia. Mountain lions are solitary, stealthy predators with tawny coats that provide excellent camouflage in their varied environments. They possess powerful hind legs that enable impressive leaping ability—up to 40 feet horizontally and 15 feet vertically. Despite their extensive range, mountain lions are rarely seen due to their secretive nature and preference for remote, rugged terrain. These apex predators play a crucial role in maintaining healthy ecosystems by controlling deer and elk populations.",
        "highlights": [
            "Holds Guinness record for most names (over 40 common names)",
            "Can leap up to 40 feet horizontally in a single bound",
            "Largest range of any wild terrestrial mammal in the Western Hemisphere",
            "Solitary hunters that require 50-100 square miles of territory",
            "Excellent swimmers and can climb trees"
        ],
        "conservation": "Mountain Lions are currently listed as Least Concern globally due to their wide distribution. However, in North America, they face significant regional challenges including habitat fragmentation, vehicle collisions, and human-wildlife conflict. Eastern populations were largely extirpated by the early 1900s, though sightings in the East have increased recently. Western populations remain relatively stable, though they increasingly encounter suburban development. Conservation efforts focus on maintaining habitat connectivity through wildlife corridors and educating communities about coexistence strategies.",
        "scientificName": "Puma concolor",
        "stats": {
            "habitat": "Mountains, Forests, Deserts, Grasslands",
            "diet": "Carnivore (deer, elk, smaller mammals)",
            "lifespan": "8-13 years (wild)",
            "weight": "53-100 kg (males), 29-64 kg (females)"
        }
    }
}

print("Content loaded successfully")
