# pylint: disable=C0111
c = c  # noqa: F821 pylint: disable=E0602,C0103
config = config  # noqa: F821 pylint: disable=E0602,C0103


c.auto_save.session = True
c.tabs.position = "left"
c.tabs.width = "12%"
c.completion.shrink = True
c.completion.open_categories = ['searchengines', 'quickmarks', 'bookmarks', 'history', 'filesystem']
c.editor.command = ['alacritty', '-e', 'nvim', '{file}', '-c', 'normal {line}G{column0}l']
c.content.javascript.enabled = True
c.qt.args = [
  "auth-server-allowlist=*.yourdomain.local,*.fedoraproject.org",
  "disable-auth-negotiate-cname-lookup=true",
]

# Prevents *all* tabs from being loaded on restore, only loads on activating them
c.session.lazy_restore = True

# Load dark mode
c.colors.webpage.darkmode.enabled = True
c.colors.webpage.darkmode.algorithm = 'lightness-cielab'
c.colors.webpage.darkmode.policy.images = 'never'
config.set('colors.webpage.darkmode.enabled', False, 'file://*')

# Privacy settings
config.set("content.webgl", False, "*")
config.set("content.canvas_reading", False)
config.set("content.geolocation", False)
config.set("content.webrtc_ip_handling_policy", "default-public-interface-only")
config.set("content.cookies.accept", "all")
config.set("content.cookies.store", True)

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

# Load the autoconfig.yml configuration
config.load_autoconfig()

