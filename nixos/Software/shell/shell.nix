{pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    most
  ];

  environment.interactiveShellInit = ''
    ssh-add ~/.ssh/github-key &> /dev/zero
    echo ""
    alias rebuild="sudo nixos-rebuild switch --flake '.#' -j 12 --cores 1"
    export PAGER=most
  '';
  
  programs.bash.shellAliases = {
    scan="scanimage --source Duplex --format=png --batch=\"\$\(date --iso-8601\)-%d.png\"";
    ls="ls --group-directories-first --color=tty";
    bb="pdflatex -synctex=1 -interaction=nonstopmode";
  };
  
  programs.bash.promptInit = ''     
    # Provide a nice prompt if the terminal supports it.
    if [ "$TERM" != "dumb" ] || [ -n "$INSIDE_EMACS" ]; then
      PROMPT_COLOR="1;31m"
      ((UID)) && PROMPT_COLOR="1;32m"
      if [ -n "$INSIDE_EMACS" ] || [ "$TERM" = "eterm" ] || [ "$TERM" = "eterm-color" ]; then
        # Emacs term mode doesn't support xterm title escape sequence (\e]0;)
        PS1="\n\[\033[$PROMPT_COLOR\][\u@\h:\w]\\$\[\033[0m\] "
      else
      
        if [[ 0 -eq $! ]];
        then 
          RET=""
        else
          RET="$!\n"
        fi
        
        PS1="$RET < \w > <\u@\h>\n $ "
      
      fi
      if test "$TERM" = "xterm"; then
        PS1="\[\033]2;\h:\u:\w\007\]$PS1"
      fi
    fi    
  '';
  
  environment.variables = {
    PROMPT_COMMAND="history -a";      
    HISTCONTROL="ignoreboth:erasedups";
  };
  
  console.colors = [
      "282828"
      "cc241d"
      "98971a"
      "d79921"
      "458588"
      "b16286"
      "689d6a"
      "a89984"
      "928374"
      "fb4934"
      "b8bb26"
      "fabd2f"
      "83a598"
      "d3869b"
      "8ec07c"
      "ebdbb2"
  ];
  
}
