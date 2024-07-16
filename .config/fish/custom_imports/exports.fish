set -g -x NPM_PACKAGES "$HOME/.npm-packages"
set -g -x ZSH "$HOME/.oh-my-zsh"
set -g -x TERM xterm-256color

#wayland stuff
# set -g -x DISPLAY $WAYLAND_DISPLAY
set -g -x MOZ_ENABLE_WAYLAND 1
set -g -x XDG_RUNTIME_DIR /run/user/1000
# set -g -x QT_AUTO_SCREEN_SCALE_FACTOR 1
# set -g -x QT_QPA_PLATFORM wayland
# set -g -x QT_WAYLAND_DISABLE_WINDOWDECORATION 1
set -g -x GDK_BACKEND "wayland,x11"
set -g -x XDG_CURRENT_DESKTOP sway
set -g -x WLR_NO_HARDWARE_CURSORS 1

set -g -x PKG_CONFIG_PATH "/usr/local/lib/pkgconfig"
set -g -x _JAVA_AWT_WM_NONREPARENTING 1

# Wing prefix
set -g -x WINEPREFIX ~/.wine

set -g -x XCURSOR_SIZE 26

# Little hack to make cargo work with git ssh
set -g -x CARGO_NET_GIT_FETCH_WITH_CLI true
