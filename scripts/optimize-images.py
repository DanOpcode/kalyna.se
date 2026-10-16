"""Regenerate homepage WebP assets with Pillow 12.2.0.

Install Pillow in a virtualenv, then run this script from any directory.
Original images are retained as the editable source assets.
"""
from pathlib import Path

from PIL import Image, ImageOps

ROOT = Path(__file__).resolve().parents[1]
images = ROOT / "extra/images"
original_total = optimized_total = 0
sources = list(images.iterdir()) + list((ROOT / "assets/logo-sources").glob("*"))
for source in sorted(sources):
    if source.suffix not in {".png", ".jpg"}:
        continue
    if not (source.stem.startswith(("profile", "company_logo")) or source.stem == "logo"):
        continue
    with Image.open(source) as original:
        image = ImageOps.exif_transpose(original)
        targets = [((images / source.name).with_suffix(".webp"), image)]
        if source.stem.startswith("profile"):
            # Portraits display at 192 CSS pixels. Supply real detail at up to
            # 3x density from the same square crop, without upscaling.
            if image.width != image.height or image.width < 576:
                raise ValueError(f"{source.name} must be square and at least 576px wide")
            targets = []
            for width in (192, 384, 576):
                portrait = image.copy()
                portrait.thumbnail((width, width), Image.Resampling.LANCZOS)
                suffix = "" if width == 192 else f"-{width}"
                target = source.with_name(f"{source.stem}{suffix}.webp")
                targets.append((target, portrait))
        elif source.stem == "logo":
            # The hero logo displays at 64 CSS pixels. Generate each density
            # directly from the full-resolution original, without upscaling.
            if image.width < 192:
                raise ValueError("logo.png must be at least 192px wide")
            targets = []
            for width in (64, 128, 192):
                height = round(image.height * width / image.width)
                logo = image.resize((width, height), Image.Resampling.LANCZOS)
                suffix = "" if width == 64 else f"-{width}"
                targets.append((images / f"logo{suffix}.webp", logo))
        elif source.stem.startswith("company_logo"):
            # Company logos display inside a 264 x 80 CSS-pixel box. Keep up to
            # twice that resolution for high-density screens; never upscale.
            image.thumbnail((528, 160), Image.Resampling.LANCZOS)
        for target, derivative in targets:
            if source.stem == "company_logo_altero":
                # This flat-colour logo needs only a small palette. Retain
                # antialiased edges with 64 colours and encode it losslessly.
                derivative = derivative.quantize(colors=64).convert("RGBA")
                derivative.save(target, "WEBP", lossless=True, method=6)
            else:
                derivative.save(target, "WEBP", quality=85, method=6)
    before = source.stat().st_size
    after = sum(target.stat().st_size for target, _ in targets)
    original_total += before
    optimized_total += after
    print(f"{source.name}: {before:,} -> {after:,} bytes")
print(f"Total: {original_total:,} -> {optimized_total:,} bytes "
      f"({1 - optimized_total / original_total:.1%} smaller)")
