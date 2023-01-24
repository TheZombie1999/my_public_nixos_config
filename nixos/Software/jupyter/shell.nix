let
  jupyter = import (builtins.fetchGit {
    url = https://github.com/tweag/jupyterWith;
    # Example working revision, check out the latest one.
    rev = "45f9a774e981d3a3fb6a1e1269e33b4624f9740e";
  }) {};

  iPython = jupyter.kernels.iPythonWith {
    name = "python";
    packages = p: with p; [ numpy ];
  };

  iHaskell = jupyter.kernels.iHaskellWith {
    name = "haskell";
    packages = p: with p; [ hvega formatting ];
  };

  let
    custom-python-env = pkgs.python3.buildEnv.override
    {
      extraLibs = with pkgs.python3Packages; [ xlrd ];
      ignoreCollisions = true;
    };
  in {
  iJulia =
    let
      juliaPackages = builtins.getEnv "PRJ_ROOT" + "/packages/julia/";
    in
    jupyterWith.kernels.iJuliaWith rec {
      name = "Julia-data-env";
      #Project.toml directory
      activateDir = juliaPackages;
      # JuliaPackages directory
      JULIA_DEPOT_PATH = juliaPackages + "/julia_depot";
      extraEnv = {
        #TODO NEXT VERSION or PATCH
        #https://github.com/JuliaLang/julia/issues/40585#issuecomment-834096490
        PYTHON = "${custom-python-env}/bin/python";
      };
    };
  }


  jupyterEnvironment =
    jupyter.jupyterlabWith {
      kernels = [ iPython iHaskell iJulia ];
    };
in
  jupyterEnvironment.env