{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Terminal utilities
    alacritty
    fzf
    ripgrep
    fd
    bat
    eza
    btop
    tree
    unzip

    # Window manager and system tools
    i3status
    i3lock
    rofi
    feh
    maim
    xclip
    brightnessctl
    pamixer

    # Applications
    chromium
    pcmanfm

    # Development tools
    git
    inxi
    starship

    # Frontend development
    nodejs_20
    yarn
    pnpm
    bun

    # Rust development
    rustup

    # Build tools
    gcc
    cmake
    pkg-config
    openssl

    # LSP servers and formatters
    nodePackages.typescript-language-server
    nodePackages.vscode-langservers-extracted
    nodePackages.prettier
    nodePackages.eslint
    tailwindcss-language-server
    emmet-ls
    vscode-extensions.bradlc.vscode-tailwindcss
  ];
}
