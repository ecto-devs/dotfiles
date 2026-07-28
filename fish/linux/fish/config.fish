# Source stuff
source /usr/share/cachyos-fish-config/cachyos-config.fish
fzf --fish | source
zoxide init fish | source

# Functions
function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	command yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

#Aliases
alias lt='eza -aT --color=always --group-directories-first --icons'

# Abbreviations
abbr -a -- v nvim
abbr -a -- ff fastfetch
abbr -a -- g lazygit

# abbr -a -- ll exa --icons --color=auto --header -1 --hyperlink
# abbr -a -- tt exa -T --icons --color=auto --header --hyperlink --git-ignore

abbr -a -- dots cd ~/.config
abbr -a -- repos cd ~/Repos
abbr -a -- projects cd ~/Projects

abbr -a -- ts tailscale

abbr -a -- mountshare sudo mount -t cifs -o username=lxc //ecto-rasp/ecto-share /mnt/smb/ecto-share
abbr -a -- mountsharep sudo mount -t cifs -o username=lxc //ecto-rasp/share_p /mnt/smb/share_p

# Binds
bind \t accept-autosuggestion

#  Env vars 
set -g fish_key_bindings fish_vi_key_bindings #use vi mode 
set -gx EDITOR nvim
set -Ux ROCM_PATH /opt/rocm  # Base install dir for ROCm; other vars reference this
set -Ux PATH $ROCM_PATH/bin $PATH  # Adds ROCm binariesto your shell command search path
set -Ux LD_LIBRARY_PATH $ROCM_PATH/lib $ROCM_PATH/lib64 $LD_LIBRARY_PATH  # Tells the dynamic linker where to find ROCm's .so libraries



