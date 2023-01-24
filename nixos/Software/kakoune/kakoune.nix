{pkgs, ...}:
with pkgs;
let
  myKakoune =
  let
    config = pkgs.writeTextFile (rec {
      name = "kakrc.kak";
      destination = "/share/kak/autoload/${name}";
      text = ''
        colorscheme gruvbox-dark
        set global ui_options ncurses_assistant=cat
        
        
        evaluate-commands %sh{
            plugins="$kak_config/plugins"
            mkdir -p "$plugins"
            [ ! -e "$plugins/plug.kak" ] && \
                git clone -q https://github.com/andreyorst/plug.kak.git "$plugins/plug.kak"
            printf "%s\n" "source '$plugins/plug.kak/rc/plug.kak'"
        }
        plug "andreyorst/plug.kak" noload        
        
        plug "doppioandante/kakoune-julia-mode"
        
        
        require-module julia-mode

        hook global WinSetOption filetype=julia %{
            set buffer indentwidth 0
            julia-mode-start
            julia-mode-enable-autocomplete
        }        

      '';
    });
  in
  kakoune.override {
    plugins = with kakounePlugins; [ config parinfer-rust ];
  };
in{
  environment.systemPackages = [ myKakoune ];
}