# Theo's dotfiles

> Collection of my personal configuration files. The reason why this README is so long is because I forget things often, definitely not because I like wasting time writing documentation that no one will ever read instead of doing actual work.

![macos_sc](./assets/macos-rice-screenshot-2023-01-22.jpg)
![fedora_sc](./assets/fedora-screenshot-2022-07-25.png)

Here are dotfiles for my systems, the 2020 MacBook Air with M1 processor and Lenovo ThinkPad T460s with i5.
MBA runs the latest version of macOS, and T460s runs the latest version of Fedora Workstation with i3 and Sway window manager.
You are free to use all or some of the dotfiles in your system, but my dotfiles are tailored toward me, and they might not suit your taste (in other words, they suck).

## Pre-requisites (in order of importance)

- \*nix system
- Git and internet connection (to clone the repo)
- Bash

## Usage

Clone this repository in the home directory.

`git clone https://github.com/theopn/dotfiles.git ~/dotfiles`

Run the installation script (do not run with sudo as Homebrew will not like that).

`bash ~/dotfiles/deploy.sh`

## After installation

- Neovim: `:PackerSync`, then `:Mason` to check the available lsp servers to install //TODO
  - Reference `server_list` table in `nvim/lua/lsp.lua` for the server list
  - Fedora does not ship with `g++`, which `nvim-tree-sitter` uses to install tree sitters. So `dnf install -y g++`
- Doom Emacs:

```bash
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.emacs.d
~/.emacs.d/bin/doom install
```

- Firefox: Install `vimium` and apply the configuration
- Install fonts. You can utilize the included `fonts/font_test.sh` to test if your terminal emulator correctly displays the fonts
- Dotfiles for Linux are not automatically deployed. Manually make symlinks for them if needed

## Highlights

### Cross-platform

#### Bash

> For school SSH server

Basic shell setting with just ls alias and prompt.

#### Doom Emacs

> To-do list

//TODO

Currently only using it for the Org mode. Planning on expanding its usage.

#### Firefox

> Main browser 

Just a vimium configuration.

#### Fonts

> I like weird fonts

- [Comic Mono](https://dtinth.github.io/comic-mono-font/): Mono-spaced version of Comic Sans. The best font in the world.
- [NERD font version](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FantasqueSansMono) of [Fantasque Sans Mono](https://github.com/belluzj/fantasque-sans).

Honorable mentions for [DaddyTimeMono Nerd Font](https://www.programmingfonts.org/#daddytimemono) and [Hermit Nerd Font](https://www.programmingfonts.org/#hermit).

#### Git

> Hail Linus

No comment.

#### kitty

> Terminal emulator

Configuration includes Dracula color scheme and borderless look. `color_test.sh` is included to test color outputs.

#### Mutt

> Command-line email client

Configuration includes automatically opening HTML contents in w3m, Vim style keybindings, and Dracula theme. Templates to add a new email account are included.

#### Neofetch

> Essential

Happy ricing!

#### Neovim

> My IDE for most language (except for Java) and a text editor for blog writing, note taking, quick idea capture, and so much more

Due to requests of my friends in CS252, my Neovim configuration has moved to a separate repository [Theovim](https://github.com/theopn/theovim)

Configuration is written 100% in Lua.

- `theo_init.lua`: Settings that does not require an external plug-in; id est keybindings, functions, base settings, etc.
- `plugins.lua`: A table to manage plug-in using [Packer](https://github.com/wbthomason/packer.nvim)
- `appearance.lua`: Settings for theme, tab and status bar, startup dashboard, etc.
- `file_et_search.lua`: Settings for Telescope, NVimTree, and any file browser related plug-ins
- `lsp.lua`: Settings for Neovim built-in LSP engine, servers, auto-completion, etc.
- `grave.lua`: Any configuration that is not used anymore but is worth keeping

#### tmux

> Actual terminal emulator

Configuration includes a handmade Dracula themed status bar, prefix changed from `C-b` to `C-a`, and other keybindings inspired by Vim.

#### Vim

> Focused note taker

- Configurations for [Vimwiki](https://github.com/vimwiki/vimwiki) and other note-taking related plug-ins managed by [vim-plug](https://github.com/junegunn/vim-plug)
- `drakai.vim`, which is a custom-made colorscheme of a mix between Dracula and Monokai is included in `.vim` folder

#### Zsh

> I don't like my shell selling t-shirts

No oh-my-zsh.

- Quirky, smart, cool, and mysterious alias like:
  - `nvif` to find files using `fzf` and `fd` and launch on Neovim
  - `trash` to move a file/folder to `$HOME/trash_zsh/`
  - `google` to launch Google on `w3m` (Startpage requires JavaScript :( )
- Fairly fast and informative prompt

### Linux

Fedora Fedora Fedora.

#### Awesome

Migrated to [separate repository](https://gitlab.com/theopn/hunted-tiles). Configuring Awesome is a Lua software engineering project.

#### Dunst

Notification daemon, and is also used to grep the result of `cal` command and weather information to display them as a pop-up.

#### i3 (i3-gap)

Below are the packages mentioned in my configuration.

- Brightnessctl: Backlight control
- Clipit: Clipboard manager
- Dunst: Notification daemon
- Feh: Wallpaper
- Flameshot: Screenshot on X
- i3lock: Simple lock program
- Picom: Compositor
- Polybar: This is where all the ricing takes place.
- Redshift: Blue light filter/nightlight/nightshift
- Rofi: App launcher and more
- setxkbmap: Swap caps lock and control, your pinky will thank you.
- xinput: Enabling trackpad natural scrolling and tap to click
- xss-lock: Calling i3lock before suspending

Below is a list of keybindings that are unique to my setup.

- Instead of `jkl;`, Vim keybinding of `hjkl`.
- Instead of `$mod+h`, `$mod+z` toggles horiZontal split.
- In addition to the default binding of `$mod+d`, `$mod+Space` launches the app launcher.
- `$mod+Shift+c, r, e` (originally config reload, restart, exit) all redirects to `system_mode`, which you can choose all the above actions and `systemctl` actions.
- `Passthrough mode ($mod+Shift+p)` lets you use keybindings that are bound to both i3 and other program (e.g: Kitty uses `super + 0` to reset the font adjustment, which overlaps with i3's "move to workspace number 10." This can be solved by executing `super + 0` in the passthrough mode).
- `$mod+Shift+v` to execute the clipboard manager.
- `$mod+Shift+n` to launch a floating terminal with Vim open for a quick note (saved as `~/Documents/i3_quicknote.txt`)
- `$mod+Shift+s` to execute screenshot tool.

Below are packages that you might want to install as well.

- Blueman: GUI Bluetooth manager
- network-manager-applet: GUI network manager
- Pavucontrol: Volume control for Pulseaudio (or Pipewire that pretends to be Pulseaudio)
- xrandr: External display output control, should be a dependency for X11 server

#### Polybar

Two configurations, they are both semi-transparent utilizing very similar modules, but one is more simplified with just one bar and the other has the top and bottom bars.

#### Sway

Wayland will be the norm one day, but today is not that day. Wayland is just too buggy for me to use every day. My Sway setup is almost a copy of the i3 setup.

- Clipman & wl-clipboard: Wayland clipboard utility (wl-clipboard) and terminal command-line clipboard history manager (clipman).
- fzf: Fuzzy finder is needed to launch the [sway-launcher-desktop](https://github.com/Biont/sway-launcher-desktop).
- Gammastep: Redshift replacement
- Grim & Slurp: Select a region in Wayland compositor (Slurp) and take a screenshot (Grim).
- Waybar: Polybar replacement, arguably better

#### Waybar

I like the look better than Polybar. A colorful top bar that contains all the necessary information.

### macOS

#### Homebrew

Bolded items are in `Brewfile_core`, and other items are in `Brewfile_optional`, either because I don't want them to be installed on every machine or are too large.

Formulae:

- bat: Fancier `cat` replacement
- **fd**: Alternative of `find` to list file entries
- ffmpeg: Primarily used for `ffmpeg -i in.xxx out.yyy`
- **fzf**: Command line fuzzy finder
- figlet: ASCII art generator
- Hugo: Static website generator
- **htop**: System monitor
- **Lua**
- mutt: TUI email client
- **node**: Node JS
- **neofetch**
- **neovim**
- **ranger**: TUI file explorer
- **tmux**
- w3m: TUI web browser. Useful for a quick Google search or viewing HTML contents in Mutt

| Type | Casks |
| ---- | ----- |
| Anti-Productivity | - Spotify<br> - Minecraft<br> - Discord: Ugh
| Development | - Docker<br> - **kitty**<br> - IntelliJ CE: Ugh Java<br> - **MacVim**<br> - **VSCode**
| Productivity| - Emacs (GUI version): To-do list app<br> - Notion<br> - **Obsidian**
| System (MacOS) | - Alfred: Spotlight replacement<br> - AppCleaner: App remover for MacOS<br> - **Amethyst: "Tiling window manager" for MacOS**<br> - **Keka**: File archiver<br> - Stats: System monitoring tool
| Tools | - Bitwarden: Password manager<br> - Cryptomator: File encryption tool<br> - Nextcloud: I host a personal Nextcloud server on VPS<br> - OBS: Recording tool
| Web | - Brave: Secondary Chromium browser. Would use a pure Chromium, but hey, free money<br> - **Firefox**<br> - Thunderbird

#### Settings

Remove Dock unhide animation, add a Dock spacer, Finder hidden file, screenshot format and location, etc.

