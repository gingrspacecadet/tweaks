import json
from pathlib import Path

# List of wood types you want to support
wood_types = [
    "oak",
    "spruce",
    "birch",
    "jungle",
    "acacia",
    "dark_oak",
    "mangrove",
    "cherry",
    "bamboo"
]

# Output directory
out_dir = Path("stonecutting")
out_dir.mkdir(exist_ok=True)

# Generate each recipe
for wood in wood_types:
    recipe = {
        "type": "minecraft:stonecutting",
        "ingredient": f"minecraft:{wood}_planks",
        "result": {
            "count": 16,
            "id": f"minecraft:{wood}_button"
        }
    }
    
    # Write JSON file, name based on wood type
    filename = out_dir / f"{wood}_buttons_from_planks_stonecutting.json"
    with filename.open("w") as f:
        json.dump(recipe, f, indent=2)

print(f"Generated {len(wood_types)} recipes in {out_dir}/")
