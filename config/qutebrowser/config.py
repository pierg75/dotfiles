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

# Prevents *all* tabs from being loaded on restore, only loads on activating them
c.session.lazy_restore = True

# Load dark mode
c.colors.webpage.prefers_color_scheme_dark = True
c.colors.webpage.darkmode.enabled = True

# Search engines
c.url.searchengines = {
    "DEFAULT": "https://duckduckgo.com/?q={}",
    "g": "https://www.google.com/search?q={}",
    "r": "https://reddit.com/r/{}",
    "w": "https://en.wikipedia.org/w/index.php?search={}",
    "gh": "https://github.com/search?q={}",
    "yt": "https://www.youtube.com/results?search_query={}",
    "maps": "https://www.google.fr/maps?q={}",
    "rstd": "https://doc.rust-lang.org/std/index.html?search={}",
    "crate": "https://crates.io/search?q={}",
    "rdocs": "https://docs.rs/releases/search?query={}",
}

c.colors.webpage.darkmode.*
