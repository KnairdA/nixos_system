{ pkgs }:

let
  vimrc   = builtins.readFile ./conf/rc.vim;
  plugins = pkgs.callPackage ./plugins.nix {};
in
{
  vam = {
    knownPlugins = pkgs.vimPlugins // plugins;
    pluginDictionaries = [
      { names = [
        "ctrlp"
        "goyo"
        "vim-far"
        "fugitive"
        "surround"
        "vim-unimpaired"
        "vim-mundo"
        "vim-airline"
        "vim-gitgutter"
        "vim-git-commit-viewer"
        "vim-signature"
        "vim-localvimrc"
        "vim-addon-nix"
        "vim-autoformat"
        "vim-polyglot"
        "vim-counterpoint"
        "vim-toggle-ui-elements"
        "vim-wordmotion"
        "vim-color-akr"
      ];}
    ];
  };
  customRC = vimrc;
}
