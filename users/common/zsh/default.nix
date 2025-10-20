{ pkgs, ... }:
{
  home.packages = with pkgs; [ eza bat ];
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "exa -lag --smart-group --git";
      ls = "exa";
      grep = "grep --color=auto";
      cat = "bat --style=plain";
    };

    oh-my-zsh = {
      enable = true;

      theme = "noderyos";
      custom = "$HOME/.config/zsh-custom";

      plugins = [ "git" ];
    };
  };
  home.file.omz_theme = {
    source = ./noderyos.zsh-theme;
    target = ".config/zsh-custom/themes/noderyos.zsh-theme";
  };
}
