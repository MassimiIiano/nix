{pkgs, ...}: {
  home.packages = with pkgs; [zsh-forgit gitflow];
  programs.git = {
    enable = true;
    userName = "MassimiIano";
    userEmail = "massimiliano.mola.bzs@gmail.com";
    ignores = [
      ".cache/"
      ".DS_Store"
      ".idea/"
      "*.swp"
      "*.elc"
      "auto-save-list"
      ".direnv/"
      ".venv/"
      ".vscode/"
      "node_modules"
      "result"
      "result-*"
    ];
    
    extraConfig = {
      init = {defaultBranch = "main";};
      delta = {
        options.map-styles = "bold purple => syntax #ca9ee6, bold cyan => syntax #8caaee";
        line-numbers = true;
      };
    };

    aliases = {
      essa = "push --force";
      co = "checkout";
      fuck = "commit --amend -m";
      c = "commit -m";
      ca = "commit -am";
      forgor = "commit --amend --no-edit";
      graph = "log --all --decorate --graph --oneline";
      oops = "checkout --";
      l = "log";
      r = "rebase";
      s = "status --short";
      ss = "status";
      d = "diff";
      st = "status";
      br = "branch";
    };
  };
}