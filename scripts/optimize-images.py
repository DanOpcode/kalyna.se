"""Regenerate homepage WebP assets with Pillow 12.2.0.

Install Pillow in a virtualenv, then run this script from any directory.
Original images are retained as the editable source assets.
"""
from pathlib import Path

from PIL import Image, ImageOps

ROOT = Path(__file__).resolve().parents[1]
images = ROOT / "extra/images"
original_total = optimized_total = 0
for source in sorted(images.iterdir()):
    if source.suffix not in {".png", ".jpg"}:
        continue
    if not (source.stem.startswith(("profile", "company_logo")) or source.stem == "logo"):
        continue
    with Image.open(source) as original:
        image = ImageOps.exif_transpose(original)
        # Company logos display inside a 264 x 80 CSS-pixel box. Keep up to
        # twice that resolution for high-density screens; never upscale.
        if source.stem.startswith("company_logo"):
            image.thumbnail((528, 160), Image.Resampling.LANCZOS)
        target = source.with_suffix(".webp")
        image.save(target, "WEBP", quality=85, method=6)
    before, after = source.stat().st_size, target.stat().st_size
    original_total += before
    optimized_total += after
    print(f"{source.name}: {before:,} -> {after:,} bytes")
print(f"Total: {original_total:,} -> {optimized_total:,} bytes "
      f"({1 - optimized_total / original_total:.1%} smaller)")
