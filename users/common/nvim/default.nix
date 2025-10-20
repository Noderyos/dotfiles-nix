{ pkgs, ... }:
{
  home.file.nvim_config = {
    source = ./nvim;
    target = ".config/nvim";
    recursive = true;
  };

  programs.neovim = {
    enable = true;
  };
}
