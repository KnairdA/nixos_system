{ pkgs }:

let
  vimrc   = builtins.readFile ./asset/rc.vim;
  plugins = pkgs.callPackage ./plugins.nix {};
in
{
  vam = {
    knownPlugins = pkgs.vimPlugins // plugins;
    pluginDictionaries = [
      { names = [
      # UI enhancements
        "vim-airline"
        "goyo"
        "vim-toggle-ui-elements"
      # load project specific config
        "vim-localvimrc"
      # colors, syntax highlighting
        "vim-color-akr"
        "vim-polyglot"
        "vim-addon-nix"
      # file, buffer management
        "ctrlp"
        "vim-counterpoint"
        "vim-signature"
      # undo history tree
        "vim-mundo"
      # editing enhancements
        "vim-wordmotion"
        "vim-autoformat"
        "surround"
        "vim-unimpaired"
        "vim-far"
      # git integration
        "fugitive"
        "vim-gitgutter"
        "vim-gina"
      ];}
    ];
  };
  customRC = vimrc;
}
