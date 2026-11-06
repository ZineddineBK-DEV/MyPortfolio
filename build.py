#!/usr/bin/env python3
"""Inlines Open Sans into the HTML so the page is one self-contained file.

Reads the pristine template and writes index.html. The template is patched in
memory only, so running this twice can never double-embed the fonts.
"""
import base64, pathlib, sys

root = pathlib.Path("/home/user")
html = (root / "portfolio/template.html").read_text(encoding="utf-8")

if "{{FONT_REG}}" not in html:
    sys.exit("template is already built — it holds no placeholders. Restore it first.")

fonts = {tag: root / f"fonts/OpenSans-{name}.ttf" for tag, name in
         (("{{FONT_REG}}", "Regular"), ("{{FONT_SEMI}}", "SemiBold"), ("{{FONT_BOLD}}", "Bold"))}

for tag, path in fonts.items():
    html = html.replace(tag, base64.b64encode(path.read_bytes()).decode())

(root / "portfolio/index.html").write_text(html, encoding="utf-8")
print("wrote index.html:", round(len(html.encode()) / 1024), "KB")
