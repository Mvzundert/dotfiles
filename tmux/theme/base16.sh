# Basee16 Styling Guidelines:

base00=default   # - Default
base01='#151515' # - Lighter Background (Used for status bars)
base02='#202020' # - Selection Background
base03='#303030' # - Comments, Invisibles, Line Highlighting
base04='#505050' # - Dark Foreground (Used for status bars)
base05='#D0D0D0' # - Default Foreground, Caret, Delimiters, Operators
base06='#E0E0E0' # - Light Foreground (Not often used)
base07='#F5F5F5' # - Light Background (Not often used)
base08='#AC4142' # - Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
base09='#D28445' # - Integers, Boolean, Constants, XML Attributes, Markup Link Url
base0A='#F7CA88' # - Classes, Markup Bold, Search Text Background
base0B='#90A959' # - Strings, Inherited Class, Markup Code, Diff Inserted
base0C='#75B5AA' # - Support, Regular Expressions, Escape Characters, Markup Quotes
base0D='#6A9FB5' # - Functions, Methods, Attribute IDs, Headings
base0E='#AA759F' # - Keywords, Storage, Selector, Markup Italic, Diff Changed
base0F='#8F5536' # - Deprecated, Opening/Closing Embedded Language Tags, e.g. <? php ?>

set -g status-left-length 40
set -g status-right-length 32
set -g status-interval 1 

# default statusbar colors
set-option -g status-fg $base08
set-option -g status-bg $base00
set-option -g status-attr $base00 

set-window-option -g window-status-fg $base08
set-window-option -g window-status-bg $base00

# Window status
set -g window-status-format " #I:#W#F "
set -g window-status-current-format " #I:#W#F "

# active window title colors
set-window-option -g window-status-current-fg $base0E
set-window-option -g window-status-current-bg $base00

# pane border colors
set-window-option -g pane-border-fg $base07
set-window-option -g pane-active-border-fg $base0E

# message text
set-option -g message-fg $base0C
set-option -g message-bg $base00

# pane number display
set-option -g display-panes-active-colour $base0E
set-option -g display-panes-colour $base00

# clock
set-window-option -g clock-mode-colour $base0C

tm_session_name="#[default,bg=$base00,fg=$base0E] #S "
set -g status-right "$tm_session_name $tm_date"

tm_tunes="#[fg=$base00,bg=$base00] ♫ #{spotify_artist}: #{spotify_track}"
tm_battery="#[fg=$base00,bg=$base00] ♥ #{battery_level}"
tm_date="#[default,bg=$base00,fg=$base0C] %R"
tm_host="#[fg=$base0E,bg=$base00] #h "

set -g status-left "$tm_tunes $tm_battery"
