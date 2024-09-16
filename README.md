# Theo's dotfiles

> [!NOTE]
> Collection of my configuration files. The reason why this README is so long is definitely not because I like wasting time writing documentation that no one will ever read instead of doing actual work.

| ![macos-sc](./assets/macos-sc.jpg) |
|:--:|
| macOS (my Yabai setup is no longer in use, see [Deprecated](./deprecated/) |

| ![fedora-sc](https://raw.githubusercontent.com/theopn/haunted-tiles/main/assets/sway-sc.png) |
|:--:|
| Fedora w/ Sway WM (~~ackchyually, it is a Wayland compositor~~) |

Here are dotfiles for my systems, M1 MacBook Air and Lenovo ThinkPad X270.
MBA runs the latest version of macOS, and X270 runs the latest version of Fedora Sway Spin with i3 WM installed (Wayland is *almost* there).

Tools in this repository are mostly open-source utilities for development.

> [!IMPORTANT]
> You are welcome to take inspiration from any files in this repository, but I do not claim any responsibility for any of the contents of the configurations (licensed under the MIT License).
> **Read the code before you use it!**

## Installation

- Configure cross-platform utilities using the following commands:
    ```bash
    git clone https://github.com/theopn/dotfiles.git ~/dotfiles
    ~/dotfiles/dotfiles-util.sh --install
    ~/dotfiles/dotfiles-util.sh --delete-backup # Optional
    ```

- Install Homebrew and configure macOS-specific utilities and settings using the following commands:
    ```bash
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew analytics off

    ~/dotfiles/dotfiles-util.sh --macos-install
    ```

- Choose configurations in the `misc` directory and manually copy them! Follow the commands in `./misc/README.md`.

### Install My Other Projects

> [!NOTE]
> Shameless plugs

- [Theovim](https://github.com/theopn/theovim) "is my Neovim configuration, geared toward my CS studies (C, Python, Java, LaTeX, LaTeX, and LaTeX).
    It features opinionated base Vim settings and keybindings, ~30 carefully selected plug-ins, and custom UI components written 100% in Lua."
- [Haunted Tiles](https://github.com/theopn/haunted-tiles/) "is my personal i3 WM and Sway setup, along with essential tiling WM tools.
    It used to be a part of my dotfiles repository, and with the growing size of configurations and shared scripts between i3 and Sway, I made a separate repository for it."

### Post-Installation

- Install Doom Emacs:
    ```bash
    git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
    ~/.config/emacs/bin/doom install
    ```
    - I had the best experience running natively-compiled [emacs-plus](https://github.com/d12frosted/homebrew-emacs-plus) in macOS
    ```bash
    brew tap d12frosted/emacs-plus
    brew install emacs-plus --with-native-comp --with-modern-doom3-icon
    ~/.emacs.d/bin/doom sync # if you have already initialized Doom with other version of Emacs
    ```

- Add SSH shortcut for frequently used servers:
    ```bash
    ~/dotfiles/dotfiles-util.sh --add-ssh-shortcut
    # Follow the prompt
    ```

- To install fonts via `fontconfig` and the included function in `dotfiles-util.sh`:
    1. Navigate to [NERD Fonts download](https://www.nerdfonts.com/font-downloads) website
    2. Right-click on the font download and copy the link
    3. Execute the following
        ```bash
        $FONT_URL=thing-you-just-copied
        ~/dotfiles/dotfiles-util.sh --install-font $FONT_URL
        ```

- To install Iosevka Nerd Font (for terminal emulators and text editors) and FantasqueSansM Nerd Fonts (for window managers) using Homebrew:
    ```bash
    brew tap homebrew/cask-fonts &&
    brew install --cask font-iosevka-nerd-font font-fantasque-sans-mono-nerd-font
    ```

## Shells

### Fish

> Rich built-in features, questionable syntax

It's the de facto default shell that launches when Wezterm opens.
It has a fantastic built-in auto-completion and stupidly fast asynchronous Git status, but I cannot say I prefer the syntax over POSIX in contrary to the popular opinion.
Because it's not POSIX compatible, Zsh is my `$SHELL`.

Usage: Most of the aliases and functions of my Zsh config are supported in Fish.

### Zsh

> The shell

- Usage:
    - Prompt:
        ```
        [vi-mode]` ➜ /current/path/ git-branch(* for unstaged, + for staged changes) | last-exit-code ❱
        ```
    - Basic aliases: `cdf` to navigate directories quickly using `fzf`,
        `cl` to `clear`, `l` to `ls` with list view and other options, `histgrep` to look up previous commands
    - `trash`, `trash_cd`, `trash_empty`, `trash_print`: trash related functions.
        The trash directory is located in `~/.theoshell/trash`. This directory will be used again for LF
    - `theoshell_plug <github-username>/<repo-name>`: installs Zsh plug-in from a GitHub repository (to `~/.theoshell/zsh-plugins`) and/or source it
        - I only install [zsh-autocomplete](https://github.com/marlonrichert/zsh-autocomplete) by default
    - `theoshell_upgrade`: Upgrade all Zsh plug-ins in `~/.theoshell/zsh-plugins`

## Terminal Emulators and Multiplexers

### tmux

> Universal terminal multiplexer

I usually pair Tmux with a simple terminal emulator like Kitty or Alacritty.
Because I am not the biggest fan of the default keybindings, many are unbound and rebound to Vim-style navigation and window/pane management.

- Usage:
    - For the complete list of keybindings, disabled default keybindings, and frequently used default bindings, use `C-a ?` and read the comment in line 20
    - `C-a` is the prefix
    - `PFX c`: Copy mode
    - `PFX hjkl`: Pane navigation
    - `PFX r/x`: Swap panes
    - `PFX s/v`: Create a split horizontally/vertically
    - `PFX -+<>`: Resize pane
    - `PFX C-s`: Send the current pane to the window of the given index (will be prompted for the index)
    - `PFX C-j`: Join the pane from the window of the given index (will be prompted for the index)
    - `PFX t`: Create a new window
    - `PFX q`: Kill a pane (there is no separate `kill-window` binding; close all panes to kill a window)
    - `PFX [/]`: Navigate windows
    - `PFX {/}`: Swap window indices with adjacent windows
    - `PFX m`: Move the current window to the given index
    - `PFX ?`: Open `~/.tmux.conf` in a floating popup

### Wezterm

> Over-engineered terminal emulator, nailed the fundamental features, and it is configured in Lua!

Wezterm is my primary terminal emulator/multiplexer!
Watch my YouTube video [Configure Wezterm terminal emulator in Lua with me [ASMR Coding]](https://youtu.be/I3ipo8NxsjY) :)

- Usage:
    - `LDR` = `C-a`
    - `LDR c`: Copy mode
    - `LDR s/v`: Create a split pane
    - `LDR hjkl`: Navigate pane
    - `LDR q`: Close pane
    - `LDR z`: Zoom pane
    - `LDR o`: Rotate pane
    - `LDR r`: `resize_pane` mode. Use `hjkl` to resize pane and `ESC` or `Enter` to confirm
    - `LDR t`: New tab
    - `LDR [/]` Navigate tab
    - `LDR 1-9`: Navigate tab by index
    - `LDR n`: Launch tab navigator
    - `LDR e`: Rename tab title
    - `LDR m`: `move_tab` mode. Use `hj`/`kl` to move tabs and `ESC` or `Enter` to confirm
        - `LDR {/}`: Move tab without entering the `move_tab` mode
    - `LDR w`: Workspace launcher
    - `$ wezterm show-keys --lua` to get the Lua table of all keybindings available

## Text Editors (besides Neovim)

### Doom Emacs

> Good OS, mediocre text editor even with Evil mode

Emacs is my to-do list, idea capture, knowledge databases, and tools for other [Second Brain](https://fortelabs.com/blog/basboverview/) functionalities.

- Usage:
    - All the stock Emacs + Evil mode keybindings
    - `%`: Jump between parenthesis like in Vim
    - `C-c t`: Toggle transparency
    - `C-c a`: Org Agenda
    - `C-c c`: Org Capture
    - `C-c o`: Display Org file outline using `occur`
    - `C-c f`: Find Org-roam node
    - `C-c i`: Insert Org-roam node
    - `C-c r b`: List all Org-roam references in the current buffer
    - `C-c r r`: Sync Org-roam database

### Vim

> Focused note-taker

Because of [my extensive Neovim IDE config](https://github.com/theopn/theovim), My Vimrc is kept minimal as my journal writer with the Vimwiki plug-in.

My Vimrc is built using [Kickstart.vim](https://github.com/theopn/kickstart.vim).

- Config:
    - Kickstart.vim contents, including sensible defaults and LSP setup
    - [Handmade TabLine](https://theopark.me/writing/2023-03-17-vimscript-bufferline/)
    - Vimwiki setup for my personal journal writing

## File Manager

### lf

> My favorite terminal file manager

When I see a CLI file manager with Vim keybindings and a minimalistic feature set, I like it. I use it.

- Usage:
    - `~` : Go to the home directory
    - `ee`: Open a file in `$EDITOR`
    - `ec`: You choose what editor you want to open a file in
    - `DD`: Move a file to `~/.theoshell/trash` (it integrates with my Zsh trash functions)
    - `gs`: [g]it [s]tatus
    - `md`: mkdir
    - `mf`: Open a file with the supplied name in Neovim
    - `ml`, `mr`, `ms`: [m]ark [l]oad, [m]ark [r]emove, [m]ark [s]ave
    - `mo`: chmod
    - `sh`: Launch `$SHELL` at the current directory

## Other Tools

### Git

> Thanks Linus

No comments.

## Miscellaneous Configurations

> [!NOTE]
> These are single-file, minimal configurations that do not change very often.
> These are meant to be manually deployed as needed.
> Use the commands in `./misc/README.md` to deploy these configurations.

- `bashrc`: I prioritize simplicity and performance since Zsh and Fish take care of my interactive uses and most of my scripts are written in Bash.
    Thus, my `.bashrc` is kept minimal with a simple prompt, some aliases, and variables
- `kitty.conf`: Kitty is my secondary terminal emulator. The configuration is kept minimal since I always pair it up with Tmux
- `ideavimrc`: Sorry to disappoint you, but I code in Java sometimes
- `neofetch.conf`: It includes a prompt inspired by "insert name" from [Neofetch Themes](https://github.com/Chick2D/neofetch-themes)

## macOS

### Rectangle

My Vim-inspired Rectangle keybindings (restore them using ./macos/vimtangle.json):

- `control + command` (`⌃⌘`) is the modifier
- `mod + h/l`: Left/right half
- `mod + j/k`: First thirds/last two thirds
- `mod + n/m`: Almost maximize/maximize
- `mod + -/=`: Smaller/larger

If you use a third-party menubar-replacement (e.g., Sketchybar), execute the following command to make Rectangle aware of the bar

```bash
defaults write com.knollsoft.Rectangle screenEdgeGapTop -int 30 # or thickness of the bar in pixel. 0 to reset
```

I also recommends you to 

- Make shortcuts for switching desktops using a built-in macOS key modifier (if you are to use Skhd for this, it requires disabling SIP)
    - Create 5 Mission Control desktops
    - "Keyboard" -> "Keyboard Shortcuts" -> "Mission Control" -> "Mission Control" -> Turn on "Switch to Desktop n" (where "n" is the number 1 - 5)
    - Set the shortcut to `^n` (`Ctrl n`) or `⌥n` (`Opt n`)
    - While you are at it, go to "Modifier Keys" and switch "Caps Lock key" and "Control key". Your pinky will thank you

### Homebrew

Bolded items are in `Brewfile_core`, and other items are in `Brewfile_optional`, either because I don't want them to be installed on every machine or are too large.

Formulae:

- fd: faster alternative to `find` (Neovim Telescope dependency)
- ffmpeg: `ffmpeg -i in.xxx out.yyy`
- figlet: ASCII art generator
- **fish**: De facto default shell
- **fzf**: Command line fuzzy finder
- git-filter-repo: tool to rewrite Git history
- **htop**: System monitor
- hugo: Static website generator
- imagemagick: Command line image manipulation
- **lf**: My favorite CLI file manager
- **lua**
- **neovim**: Where I live
- **node**
- rclone: Cloud storage management
- ripgrep: faster alternative to `grep` (Neovim Telescope dependency)
- **rust**
- **tmux**: Universal terminal multiplexer
- tree: Tree-like directory view
- **wget**: Be careful with what you download

| Type            | Casks                                                                                              |
|-----------------|----------------------------------------------------------------------------------------------------|
| Development     | - Docker<br> - IntelliJ CE<br> - kitty<br> - MacTex (No GUI)<br> - **MacVim**<br> - **Wezterm**    |
| Fun             | - Discord<br> - Minecraft<br> - Spotify                                                            |
| Productivity    | - **Emacs**<br> - **Itsycal**<br> - Notion<br>                                                     |
| System (macOS)  | - AppCleaner<br> - **Maccy**<br> - **Rectangle**<br> - **Stats**<br> - **Spaceman**                |
| Tools           | - **Bitwarden**<br> - Cryptomator<br> - GIMP<br> - OBS<br> - **Skim**<br> - VLC                    |
| Web             | - **Firefox**<br> - Thunderbird                                                                    |

### Settings

Remove Dock unhide animation, add a Dock spacer, show hidden files in Finder, change screenshot format and location (I like having every temporary file in `~/Downloads/`), etc.

## Deprecated

> [!WARNING]
> These dotfiles are unused because either I stopped using the utility or developed a new configuration.

Read the [list of deprecated configurations](./deprecated/README.md) for more information.

## Credits

- The macOS wallpaper is by [arsenicxs](https://www.deviantart.com/arsenixc/art/Tokyo-Street-Night-684804497)
- [hb's dotfiles](https://github.com/hbthen3rd/dotfiles) and [FelixKratz's dotfiles](https://github.com/FelixKratz/dotfiles) (the creator of Sketchybar) inspired my Sketchybar looks
- Other than that, all of the config/code is mine.
    - I dislike having code I don't understand, especially in my day-to-day development environment.
        I try to understand and rewrite configurations on my own
    - I give credit to all the amazing developers and the open-source community who developed all these tools I rely on every day and wrote documentation for them
    - I also would like to thank people in communities like [Dotfyle](https://dotfyle.com/) and [r/unixporn](https://www.reddit.com/r/unixporn/) who share their dotfiles that helped and inspired me
    - If you have any questions, concerns, or suggestions, do not hesitate to let me know through issues or PR!

