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
        "undotree"
        "vim-gitgutter"
        "goyo"
        "vim-localvimrc"
        "tagbar"
        "vim-addon-nix"
        "vim-autoformat"
        "vim-csexact"
        "vim-color-akr"
      ];}
    ]; 
  };
  customRC = vimrc;
}
