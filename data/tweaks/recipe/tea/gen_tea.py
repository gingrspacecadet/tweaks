#!/usr/bin/env python3
"""
generate_recipe_simple.py

Generate a vanilla shapeless crafting recipe JSON for a flower tea using the
exact structure you provided as a base.

Example:
  python generate_recipe_simple.py \
    --flower minecraft:poppy \
    --potion minecraft:long_night_vision \
    --output poppy_tea.json

This will write poppy_tea.json containing:
{
  "type": "minecraft:crafting_shapeless",
  "ingredients": [
    "minecraft:potion",
    "#minecraft:leaves",
    "#tweaks:hot",
    "minecraft:poppy"
  ],
  "result": {
    "id": "minecraft:potion",
    "components": {
      "minecraft:potion_contents": {
        "potion": "minecraft:long_night_vision",
        "custom_name": "Poppy Tea"
      }
    }
  }
}
"""

import argparse
import json
import os
import sys

def normalise_tag(tag):
    """Ensure tag strings are prefixed with '#' if they look like tags."""
    if not tag:
        return "#minecraft:leaves"
    return tag if tag.startswith("#") else ("#" + tag if ":" in tag else "#"+tag)

def normalise_item(item):
    """Return item string (verifies colon present)."""
    if not item:
        raise ValueError("item id must be provided (e.g. minecraft:poppy)")
    return item

def make_recipe(flower, potion, leaves_tag="#minecraft:leaves", heat="minecraft:blaze_powder", custom_name=None):
    flower = normalise_item(flower)
    potion = normalise_item(potion)
    leaves_tag = normalise_tag(leaves_tag)

    # Build display name if not provided
    if custom_name:
        name = custom_name
    else:
        # convert last path part to Title Case and append " Tea"
        base = flower.split(":")[-1].replace("_", " ").title()
        name = f"Sweetened {base} Tea"

    recipe = {
        "type": "minecraft:crafting_shapeless",
        "ingredients": [
            "minecraft:honey_bottle",   # your water bottle / potion input (string form)
            leaves_tag,           # tag form, e.g. "#minecraft:leaves"
            heat,                 # heat source (string item)
            flower                # the flower item used
        ],
        "result": {
            "id": "minecraft:potion",
            "components": {
                "minecraft:potion_contents": {
                    "potion": "awkward",
                    "custom_name": name,
                    "custom_effects": [
                        {
                            "id": potion,
                            "duration": 120
                        }
                    ]
                },
                "minecraft:custom_name": "§f" + name
            }
        }
    }
    return recipe

def main(argv):
    p = argparse.ArgumentParser(description="Generate a shapeless tea recipe JSON (simple format).")
    p.add_argument("--flower", required=True, help="flower item id, e.g. minecraft:poppy")
    p.add_argument("--potion", required=True, help="potion id to give, e.g. minecraft:long_night_vision")
    p.add_argument("--leaves-tag", default="#minecraft:leaves", help="leaves tag (default: #minecraft:leaves)")
    p.add_argument("--heat", default="minecraft:blaze_powder", help="heat source item (default: minecraft:blaze_powder)")
    p.add_argument("--name", default=None, help='custom display name (default: "<Flower> Tea")')
    p.add_argument("--output", default=None, help="output file path (default: ./<flowername>_tea.json)")
    args = p.parse_args(argv)

    try:
        recipe = make_recipe(args.flower, args.potion, leaves_tag=args.leaves_tag, heat=args.heat, custom_name=args.name)
    except ValueError as e:
        print("Error:", e, file=sys.stderr)
        sys.exit(2)

    out_path = args.output if args.output else os.path.join(os.getcwd(), f"sweetened_{args.flower.split(':')[-1]}_tea.json")
    with open(out_path, "w", encoding="utf-8") as f:
        json.dump(recipe, f, ensure_ascii=False, indent=2)

    print(f"Written: {out_path}")

if __name__ == "__main__":
    main(sys.argv[1:])
