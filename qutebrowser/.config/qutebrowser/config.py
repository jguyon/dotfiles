## Documentation:
##   qute://help/configuring.html
##   qute://help/settings.html

# Load settings configured via the GUI
config.load_autoconfig()

# Nord theme
# https://www.nordtheme.com/
nord0 = '#2E3440'
nord1 = '#3B4252'
nord2 = '#434C5E'
nord3 = '#4C566A'
nord4 = '#D8DEE9'
nord5 = '#E5E9F0'
nord6 = '#ECEFF4'
nord7 = '#8FBCBB'
nord8 = '#88C0D0'
nord9 = '#81A1C1'
nord10 = '#5E81AC'
nord11 = '#BF616A'
nord12 = '#D08770'
nord13 = '#EBCB8B'
nord14 = '#A3BE8C'
nord15 = '#B48EAD'

c.colors.completion.category.bg = nord3
c.colors.completion.category.border.bottom = nord0
c.colors.completion.category.border.top = c.colors.completion.category.border.bottom
c.colors.completion.category.fg = nord4
c.colors.completion.even.bg = nord1
c.colors.completion.fg = nord4
c.colors.completion.item.selected.bg = nord11
c.colors.completion.item.selected.border.bottom = c.colors.completion.item.selected.bg
c.colors.completion.item.selected.border.top = c.colors.completion.item.selected.border.bottom
c.colors.completion.item.selected.fg = c.colors.completion.fg
c.colors.completion.item.selected.match.fg = nord13
c.colors.completion.match.fg = c.colors.completion.item.selected.match.fg
c.colors.completion.odd.bg = nord2
c.colors.completion.scrollbar.bg = nord0
c.colors.completion.scrollbar.fg = nord4
c.colors.contextmenu.menu.bg = nord0
c.colors.contextmenu.menu.fg = nord4
c.colors.contextmenu.selected.bg = nord3
c.colors.contextmenu.selected.fg = nord4
c.colors.downloads.bar.bg = nord0
c.colors.downloads.error.bg = c.colors.downloads.bar.bg
c.colors.downloads.error.fg = nord11
c.colors.downloads.start.bg = c.colors.downloads.bar.bg
c.colors.downloads.start.fg = nord10
c.colors.downloads.stop.bg = c.colors.downloads.bar.bg
c.colors.downloads.stop.fg = nord14
c.colors.hints.bg = '#CC' + nord13[1:]
c.colors.hints.fg = nord0
c.colors.hints.match.fg = nord11
c.colors.keyhint.bg = '#CC' + nord0[1:]
c.colors.keyhint.fg = nord4
c.colors.keyhint.suffix.fg = nord13
c.colors.messages.error.bg = nord11
c.colors.messages.error.border = c.colors.messages.error.bg
c.colors.messages.error.fg = nord4
c.colors.messages.info.bg = nord10
c.colors.messages.info.border = c.colors.messages.info.bg
c.colors.messages.info.fg = c.colors.messages.error.fg
c.colors.messages.warning.bg = nord12
c.colors.messages.warning.border = c.colors.messages.warning.bg
c.colors.messages.warning.fg = c.colors.messages.error.fg
c.colors.prompts.bg = nord1
c.colors.prompts.border = nord4
c.colors.prompts.fg = nord4
c.colors.prompts.selected.bg = nord3
c.colors.statusbar.normal.bg = nord0
c.colors.statusbar.normal.fg = nord4
c.colors.statusbar.caret.bg = c.colors.statusbar.normal.bg
c.colors.statusbar.caret.fg = c.colors.statusbar.normal.fg
c.colors.statusbar.caret.selection.bg = c.colors.statusbar.normal.bg
c.colors.statusbar.caret.selection.fg = c.colors.statusbar.normal.fg
c.colors.statusbar.command.bg = c.colors.statusbar.normal.bg
c.colors.statusbar.command.fg = c.colors.statusbar.normal.fg
c.colors.statusbar.command.private.bg = c.colors.statusbar.normal.bg
c.colors.statusbar.command.private.fg = c.colors.statusbar.normal.fg
c.colors.statusbar.insert.bg = c.colors.statusbar.normal.bg
c.colors.statusbar.insert.fg = c.colors.statusbar.normal.fg
c.colors.statusbar.passthrough.bg = c.colors.statusbar.normal.bg
c.colors.statusbar.passthrough.fg = c.colors.statusbar.normal.fg
c.colors.statusbar.private.bg = nord3
c.colors.statusbar.private.fg = nord4
c.colors.statusbar.progress.bg = nord4
c.colors.statusbar.url.error.fg = nord11
c.colors.statusbar.url.fg = nord4
c.colors.statusbar.url.hover.fg = nord8
c.colors.statusbar.url.success.http.fg = nord4
c.colors.statusbar.url.success.https.fg = nord14
c.colors.statusbar.url.warn.fg = nord13
c.colors.tabs.bar.bg = nord0
c.colors.tabs.even.bg = nord1
c.colors.tabs.even.fg = nord4
c.colors.tabs.indicator.error = nord11
c.colors.tabs.indicator.start = nord10
c.colors.tabs.indicator.stop = nord14
c.colors.tabs.odd.bg = c.colors.tabs.even.bg
c.colors.tabs.odd.fg = c.colors.tabs.even.fg
c.colors.tabs.selected.even.bg = nord3
c.colors.tabs.selected.even.fg = nord8
c.colors.tabs.selected.odd.bg = c.colors.tabs.selected.even.bg
c.colors.tabs.selected.odd.fg = c.colors.tabs.selected.even.fg
c.colors.tabs.pinned.even.bg = c.colors.tabs.even.bg
c.colors.tabs.pinned.even.fg = c.colors.tabs.even.fg
c.colors.tabs.pinned.odd.bg = c.colors.tabs.odd.bg
c.colors.tabs.pinned.odd.fg = c.colors.tabs.odd.fg
c.colors.tabs.pinned.selected.even.bg = c.colors.tabs.selected.even.bg
c.colors.tabs.pinned.selected.even.fg = c.colors.tabs.selected.even.fg
c.colors.tabs.pinned.selected.odd.bg = c.colors.tabs.selected.odd.bg
c.colors.tabs.pinned.selected.odd.fg = c.colors.tabs.selected.odd.fg
c.colors.webpage.bg = 'white'

c.fonts.default_family = ['Iosevka Aile']
c.fonts.default_size = '11pt'
c.fonts.contextmenu = 'default_size default_family'
c.fonts.prompts = 'default_size default_family'
c.fonts.web.family.fixed = 'Iosevka Term, Noto Color Emoji'
c.fonts.web.family.sans_serif = 'DejaVu Sans, Noto Color Emoji'
c.fonts.web.family.serif = 'DejaVu Serif, Noto Color Emoji'

c.tabs.favicons.scale = 0.8
c.tabs.padding = {'top': 4, 'bottom': 4, 'left': 5, 'right': 5}
