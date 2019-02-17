# pylint: disable=C0111
c = c  # noqa: F821 pylint: disable=E0602,C0103
config = config  # noqa: F821 pylint: disable=E0602,C0103


c.tabs.position = "left"
c.tabs.width = "12%"
c.completion.shrink = True
c.editor.command = ["termite", "-e", "nvim '{}'"]
c.content.javascript.enabled = True

# Load the autoconfig.yml configuration
config.load_autoconfig()
