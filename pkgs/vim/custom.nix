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
        "goyo"
        "ack-vim"
        "tagbar"
        "vim-unimpaired"
        "vim-airline"
        "vim-gitgutter"
        "vim-localvimrc"
        "vim-addon-nix"
        "vim-autoformat"
        "vim-polyglot"
        "vim-counterpoint"
        "vim-bufferlist"
        "vim-csexact"
        "vim-color-akr"
      ];}
    ]; 
  };
  customRC = vimrc;
}
