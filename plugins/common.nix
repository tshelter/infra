{ pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [
    htop
    neofetch
    htop
    micro
    vim
    curl
    wget
    axel
    iproute2
    ethtool
    nettools
    inetutils
    git
    python310Packages.speedtest-cli
    ouch
    file
    tree
    unzip
    jq
    moreutils
    binutils
    openssl
    iotop
    iftop
    tmux
  ];
}

