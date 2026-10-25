#!/usr/bin/env python3
"""Print an undeployed CSP candidate from exact production script/style bytes."""
import base64
import hashlib
import re
from pathlib import Path

root = Path(__file__).resolve().parents[1]
hashes = {"script": set(), "style": set()}
for relative in ["index.html", "en/index.html", "404.html"]:
    html = (root / "docs" / relative).read_text()
    for tag in hashes:
        for content in re.findall(rf"<{tag}\b[^>]*>(.*?)</{tag}>", html, re.S):
            digest = base64.b64encode(hashlib.sha256(content.encode()).digest()).decode()
            hashes[tag].add(f"'sha256-{digest}'")
print("; ".join([
    "default-src 'self'",
    "base-uri 'none'",
    "object-src 'none'",
    "frame-ancestors 'none'",
    "script-src 'self' " + " ".join(sorted(hashes["script"])) + " https://static.cloudflareinsights.com",
    "style-src 'self' " + " ".join(sorted(hashes["style"])),
    "img-src 'self' data:",
    "connect-src 'self' https://cloudflareinsights.com",
    "font-src 'self'",
    "form-action 'none'",
    "upgrade-insecure-requests",
]))
