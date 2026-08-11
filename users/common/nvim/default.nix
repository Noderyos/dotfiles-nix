{ pkgs, ... }:
{
  home.file.nvim_config = {
    source = ./nvim;
    target = ".config/nvim";
    recursive = true;
  };

  home.packages = with pkgs; [ tree-sitter ];

  programs.neovim = {
    enable = true;
  };
}
