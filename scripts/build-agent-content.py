"""Generate agent-readable content from Tableau HTML using Python's standard library."""

import hashlib
from html.parser import HTMLParser
import json
from pathlib import Path
import re
import shutil
import sys
from urllib.parse import urljoin


class Node:
    def __init__(self, tag="", attrs=()):
        self.tag = tag
        self.attrs = dict(attrs)
        self.children = []

    def find(self, tag):
        if self.tag == tag:
            return self
        for child in self.children:
            if isinstance(child, Node):
                found = child.find(tag)
                if found is not None:
                    return found
        return None


class Document(HTMLParser):
    VOID = {"area", "base", "br", "col", "embed", "hr", "img", "input",
            "link", "meta", "param", "source", "track", "wbr"}

    def __init__(self, html):
        super().__init__(convert_charrefs=True)
        self.root = Node()
        self.stack = [self.root]
        self.feed(html)
        self.close()

    def handle_starttag(self, tag, attrs):
        node = Node(tag, attrs)
        self.stack[-1].children.append(node)
        if tag not in self.VOID:
            self.stack.append(node)

    def handle_startendtag(self, tag, attrs):
        self.handle_starttag(tag, attrs)
        if tag not in self.VOID:
            self.handle_endtag(tag)

    def handle_endtag(self, tag):
        for index in range(len(self.stack) - 1, 0, -1):
            if self.stack[index].tag == tag:
                self.stack = self.stack[:index]
                break

    def handle_data(self, data):
        self.stack[-1].children.append(data)


def escape(text):
    return re.sub(r"([\\`*_[\]<>])", r"\\\1", text)


def render(node, base):
    if isinstance(node, str):
        return escape(re.sub(r"\s+", " ", node))
    tag = node.tag
    if tag in {"script", "style", "svg", "nav", "label", "select", "button", "footer"}:
        return ""
    if node.attrs.get("aria-hidden") == "true" or "hidden" in node.attrs:
        return ""
    if tag in {"ul", "ol"}:
        items = [render(child, base).strip() for child in node.children
                 if isinstance(child, Node) and child.tag == "li"]
        return "\n\n" + "\n".join(items) + "\n\n"
    content = "".join(render(child, base) for child in node.children)
    if tag in {"h1", "h2", "h3", "h4", "h5", "h6"}:
        return "\n\n" + "#" * int(tag[1]) + " " + content.strip() + "\n\n"
    if tag == "a" and node.attrs.get("href"):
        url = urljoin(base, node.attrs["href"])
        return f"[{content.strip()}](<{url}>)"
    if tag == "img" and node.attrs.get("alt"):
        url = urljoin(base, node.attrs["src"])
        return f"![{escape(node.attrs['alt'])}](<{url}>)\n\n"
    if tag == "li":
        return "\n- " + content.strip() + "\n"
    if tag == "blockquote":
        return "\n\n" + "\n".join("> " + line for line in content.strip().splitlines()) + "\n\n"
    if tag in {"strong", "b"}:
        return "**" + content.strip() + "**"
    if tag in {"em", "i"}:
        return "*" + content.strip() + "*"
    if tag == "br":
        return "\n"
    if tag in {"div", "section", "p", "article", "main"}:
        return "\n\n" + content.strip() + "\n\n" if content.strip() else ""
    return content


def markdown(html, base):
    main = Document(html).root.find("main")
    if main is None:
        raise ValueError("Page has no main content")
    text = render(main, base)
    text = re.sub(r"[ \t]+\n", "\n", text)
    text = re.sub(r"\n[ \t]+", "\n", text)
    return re.sub(r"\n{3,}", "\n\n", text).strip() + "\n"


def build(output):
    pages = [("index.html", "https://www.kalyna.se/"),
             ("en/index.html", "https://www.kalyna.se/en/")]
    for filename, url in pages:
        source = output / filename
        source.with_suffix(".md").write_text(markdown(source.read_text(), url))

    # Disable Jekyll so .md and .well-known files are published unchanged.
    (output / ".nojekyll").touch()
    (output / "llms.txt").write_text(
        "# Kalyna Solutions AB\n\n"
        "> Daniel Jonsson's software development consultancy in Stockholm, Sweden.\n\n"
        "## Portfolio\n\n"
        "- [Svenska](https://www.kalyna.se/index.md): Erfarenhet, expertis och kontaktuppgifter.\n"
        "- [English](https://www.kalyna.se/en/index.md): Experience, expertise and contact details.\n"
    )

    # Copy explicitly: static generators may skip dot-directories in extra/.
    source = Path("extra/.well-known/agent-skills")
    target = output / ".well-known/agent-skills"
    shutil.copytree(source, target, dirs_exist_ok=True)
    skills = []
    for artifact in sorted(target.glob("*/SKILL.md")):
        text = artifact.read_text()
        description = re.search(r"^description: (.+)$", text, re.MULTILINE).group(1)
        skills.append({
            "name": artifact.parent.name,
            "type": "skill-md",
            "description": description,
            "url": "/" + artifact.relative_to(output).as_posix(),
            "digest": "sha256:" + hashlib.sha256(artifact.read_bytes()).hexdigest(),
        })
    (target / "index.json").write_text(json.dumps({
        "$schema": "https://schemas.agentskills.io/discovery/0.2.0/schema.json",
        "skills": skills,
    }, indent=2) + "\n")


if __name__ == "__main__":
    build(Path(sys.argv[1] if len(sys.argv) > 1 else "docs"))
    print("Generated Markdown, llms.txt and agent skills discovery.")
