#Just PATH env
export PATH=$PATH:/home/synerr/.local/bin:/usr/local/bin:/home/synerr/.local/share/gem/ruby/3.0.0/bin:/home/synerr/.cargo/bin:/home/synerr/go/bin

export ZSH="$HOME/.oh-my-zsh"


# npm config
NPM_PACKAGES="${HOME}/.npm-packages"
export PATH="$PATH:$NPM_PACKAGES/bin"
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"

export TERM=xterm-256color

#nvidia + wayland stuff
export MOZ_ENABLE_WAYLAND=1
export XDG_RUNTIME_DIR=/run/user/1000
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_QPA_PLATFORM=wayland
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
export GDK_BACKEND=wayland
export XDG_CURRENT_DESKTOP=sway
export GBM_BACKEND=nvidia-drm
export __GLX_VENDOR_LIBRARY_NAME=nvidia
export WLR_NO_HARDWARE_CURSORS=1

export NNN_PLUG='o:preview-tabbed'

export NNN_PLUG='o:fzopen;p:fixname;i:imgview;y:preview-tabbed;p:preview-tui'
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig"
#export LS_COLORS="$(vivid generate molokai)"
#
#fix Clion grey screen
export _JAVA_AWT_WM_NONREPARENTING=1

# Wine prefix
export WINEPREFIX=~/.wine
