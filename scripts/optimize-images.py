"""Regenerate homepage WebP assets with the dev-machine supplied ImageMagick.

Run with python3 from any directory; only Python's standard library is needed.
Original images are retained as the editable source assets.
"""
from pathlib import Path
from shutil import which
from subprocess import check_output, run

ROOT = Path(__file__).resolve().parents[1]
images = ROOT / "extra/images"
magick = which("magick")
if magick is None:
    raise SystemExit("ImageMagick 7 (magick) is required; dev-machine supplies it.")

original_total = optimized_total = 0
sources = (list(images.iterdir()) + list((ROOT / "assets/logo-sources").glob("*"))
           + list((ROOT / "assets/image-sources").glob("*")))
for source in sorted(sources):
    if source.suffix not in {".png", ".jpg"}:
        continue
    if not (source.stem.startswith(("profile", "company_logo")) or source.stem in {"logo", "kalyna", "daily-diff"}):
        continue

    # Measure after applying EXIF orientation, just as in the conversion below.
    width, height = map(int, check_output(
        [magick, str(source), "-auto-orient", "-format", "%w %h", "info:"],
        text=True,
    ).split())
    targets = [((images / source.name).with_suffix(".webp"), [])]
    if source.stem.startswith("profile"):
        # Portraits display at 192 CSS pixels, with detail for 1x/2x/3x screens.
        if width != height or width < 576:
            raise ValueError(f"{source.name} must be square and at least 576px wide")
        targets = []
        for size in (192, 384, 576):
            suffix = "" if size == 192 else f"-{size}"
            target = source.with_name(f"{source.stem}{suffix}.webp")
            targets.append((target, ["-resize", f"{size}x{size}>"]))
    elif source.stem == "logo":
        # Generate each density directly from the full-resolution original.
        if width < 192:
            raise ValueError("logo.png must be at least 192px wide")
        targets = []
        for size in (64, 128, 192):
            suffix = "" if size == 64 else f"-{size}"
            targets.append((images / f"logo{suffix}.webp", ["-resize", f"{size}x>"]))
    elif source.stem == "daily-diff":
        # Two-column desktop card and full-width mobile artwork, including HiDPI.
        # The 1200px original caps resolution; never upscale.
        targets = []
        for size in (480, 768, 1200):
            suffix = "" if size == 480 else f"-{size}"
            targets.append((images / f"daily-diff{suffix}.webp", ["-resize", f"{size}x>"]))
    elif source.stem.startswith("company_logo"):
        # Keep twice the 264 x 80 CSS-pixel display size; never upscale.
        targets = [(targets[0][0], ["-resize", "528x160>"])]

    for target, resize in targets:
        encoding = ["-quality", "85", "-define", "webp:method=6"]
        if source.stem == "logo":
            # Keep colour quality unchanged; quantize transparency to reduce size.
            encoding += ["-define", "webp:alpha-quality=70"]
        if source.stem == "company_logo_altero":
            # Preserve the flat-colour logo with a small, lossless palette.
            encoding = ["+dither", "-colors", "64", "-define", "webp:lossless=true",
                        "-define", "webp:method=6"]
        run([magick, str(source), "-auto-orient", "-filter", "Lanczos", *resize,
             "-strip", *encoding, str(target)], check=True)

    before = source.stat().st_size
    after = sum(target.stat().st_size for target, _ in targets)
    original_total += before
    optimized_total += after
    print(f"{source.name}: {before:,} -> {after:,} bytes")
print(f"Total: {original_total:,} -> {optimized_total:,} bytes "
      f"({1 - optimized_total / original_total:.1%} smaller)")
