# pylint: disable=C0111
c = c  # noqa: F821 pylint: disable=E0602,C0103
config = config  # noqa: F821 pylint: disable=E0602,C0103


# Load the autoconfig.yml configuration
config.load_autoconfig()

c.tabs.position = "left"
c.tabs.width = "12%"
c.completion.shrink = True
c.editor.command = ["termite", "-e", "nvim '{}'"]
c.content.javascript.enabled = True
c.qt.args = ["auth-server-whitelist=*redhat.com"]
c.url.searchengines = {
    "DEFAULT": "https://duckduckgo.com/?q={}",
    "g": "https://www.google.com/search?q={}",
    "r": "https://reddit.com/r/{}",
    "w": "https://en.wikipedia.org/w/index.php?search={}",
    "gh": "https://github.com/search?q={}",
    "rstd": "https://doc.rust-lang.org/std/index.html?search={}",
    "crate": "https://crates.io/search?q={}",
    "rdocs": "https://docs.rs/releases/search?query={}",
}
