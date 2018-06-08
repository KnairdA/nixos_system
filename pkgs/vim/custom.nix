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
        "ack-vim"
        "tagbar"
        "vim-mundo"
        "vim-unimpaired"
        "vim-airline"
        "vim-gitgutter"
        "vim-localvimrc"
        "vim-addon-nix"
        "vim-autoformat"
        "vim-polyglot"
        "vim-counterpoint"
        "vim-toggle-ui-elements"
        "vim-color-akr"
      ];}
    ];
  };
  customRC = vimrc;
}
