import importlib.util
from pathlib import Path
import unittest

spec = importlib.util.spec_from_file_location(
    "agent_content", Path(__file__).with_name("build-agent-content.py"))
agent_content = importlib.util.module_from_spec(spec)
spec.loader.exec_module(agent_content)


class MarkdownTest(unittest.TestCase):
    def test_preserves_semantics_and_resolves_links_without_ui(self):
        html = '''<main><nav>Navigation</nav><label>Theme<select>Dark</select></label>
        <h1>Daniel &amp; Kalyna</h1><p>Build <strong>software</strong> with
        <a href="/en/#contact">Daniel</a>.</p>
        <ul><li>C#/.NET</li><li>Elixir</li></ul>
        <blockquote>A recommendation.</blockquote>
        <img alt="Portrait" src="/images/profile.webp">
        <script>secret()</script><svg><title>Decorative</title></svg></main>'''
        result = agent_content.markdown(html, "https://www.kalyna.se/en/")
        self.assertIn("# Daniel & Kalyna", result)
        self.assertIn("**software**", result)
        self.assertIn("[Daniel](<https://www.kalyna.se/en/#contact>)", result)
        self.assertIn("- C#/.NET\n- Elixir", result)
        self.assertIn("> A recommendation.", result)
        self.assertIn("![Portrait](<https://www.kalyna.se/images/profile.webp>)", result)
        for ui in ["Navigation", "Theme", "Dark", "secret", "Decorative"]:
            self.assertNotIn(ui, result)

    def test_missing_content_fails_build(self):
        with self.assertRaises(ValueError):
            agent_content.markdown("<body>Missing main</body>", "https://www.kalyna.se/")


if __name__ == "__main__":
    unittest.main()
