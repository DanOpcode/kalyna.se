"""Trace retained company artwork with Pillow 12.2.0 and potracer 0.0.4.

Run from any directory. Masks use the source artwork's flat brand colours;
transparency and antialiased edge pixels are thresholded before spline tracing.
No raster images or fonts are embedded in the resulting SVGs.
"""
from pathlib import Path
import xml.etree.ElementTree as ET
import shutil
import subprocess
from tempfile import TemporaryDirectory

from PIL import Image
import potrace

ROOT = Path(__file__).resolve().parents[1]
PALETTES = {
    "altero": [(41, 69, 106)],
    "avarn": [(45, 45, 45), (88, 197, 202)],
    "cellink": [(0, 0, 0)],
    "idagree": [(105, 115, 140), (190, 194, 159), (249, 203, 107)],
    "labgruppen": [(6, 38, 45)],
}
SVG = "http://www.w3.org/2000/svg"
ET.register_namespace("", SVG)

outputs = []
for name, colours in PALETTES.items():
    source = next((ROOT / "assets/logo-sources").glob(f"company_logo_{name}.*"))
    with Image.open(source) as original:
        image = original.convert("RGBA")
    width, height = image.size
    scale = 3 if width < 500 else 1
    image = image.resize((width * scale, height * scale), Image.Resampling.LANCZOS)
    # Classify pixels against the brand palette plus white background. Fully
    # transparent pixels are excluded, even if their hidden RGB value is black.
    labels = []
    for red, green, blue, alpha in image.get_flattened_data():
        if alpha < 128:
            labels.append(-1)
            continue
        candidates = colours + [(255, 255, 255)]
        nearest = min(range(len(candidates)), key=lambda i: sum(
            (a - b) ** 2 for a, b in zip((red, green, blue), candidates[i])))
        labels.append(nearest if nearest < len(colours) else -1)
    svg = ET.Element(f"{{{SVG}}}svg", {
        "viewBox": f"0 0 {width} {height}",
        "width": str(width), "height": str(height),
    })
    def point(value):
        return f"{value.x / scale:.2f},{value.y / scale:.2f}"

    for index, colour in enumerate(colours):
        mask = Image.new("L", image.size)
        mask.putdata([0 if label == index else 255 for label in labels])
        curves = potrace.Bitmap(mask).trace(turdsize=2, alphamax=1, opttolerance=0.1)
        commands = []
        for curve in curves:
            commands.append("M" + point(curve.start_point))
            for segment in curve:
                if segment.is_corner:
                    commands.extend(("L" + point(segment.c), "L" + point(segment.end_point)))
                else:
                    commands.append("C" + " ".join(map(point, (
                        segment.c1, segment.c2, segment.end_point))))
            commands.append("Z")
        ET.SubElement(svg, f"{{{SVG}}}path", {
            "d": " ".join(commands),
            "fill": "#" + "".join(f"{channel:02x}" for channel in colour),
            "fill-rule": "evenodd",
        })
    output = ROOT / f"extra/images/company_logo_{name}.svg"
    ET.ElementTree(svg).write(output, encoding="unicode")
    outputs.append(output)

# Minify only these traces; never rewrite the supplied official SVGs.
with TemporaryDirectory() as temporary:
    for output in outputs:
        shutil.copy(output, temporary)
    subprocess.run([
        "npx", "--yes", "--package=svgo@4.0.0", "--", "svgo",
        "--multipass", "--precision=2", "--folder", temporary,
        "--output", str(ROOT / "extra/images"),
    ], check=True)
for output in outputs:
    print(f"{output.name}: {output.stat().st_size:,} bytes")
