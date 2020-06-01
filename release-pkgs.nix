{ ... }:
let
  pkgs = (import <nixpkgs> {});
  my-python = (import ./pkgs/python.nix {inherit pkgs;});
  my-go =  (import ./pkgs/go.nix {inherit pkgs;});
  my-R = (import ./pkgs/R.nix {inherit pkgs;});



  zeek = pkgs.callPackage ./pkgs/zeek {};
  broker = pkgs.callPackage ./pkgs/broker {};
  vast = pkgs.callPackage ./pkgs/vast {};

in {
  

  # nsm-data-analysis-haskell = pkgs.buildEnv {
  # name = "nsm-data-analysis-haskell";
  # paths =  [
  #   ihaskellEnv
  # ];
  # };

  nsm-data-analysis-vast = pkgs.buildEnv {
    name = "nsm-vast";
    paths = with pkgs; [
      zeek
      broker
    ];
  };
  nsm-data-analysis-zeek = pkgs.buildEnv {
    name = "nsm-zeek";
    paths = with pkgs; [
      vast
    ];
  };
  nsm-data-analysis-R = pkgs.buildEnv {
    name = "nsm-data-analysis-R";
    paths = with pkgs; [
      my-go
    ];
  };

  nsm-data-analysis-python = pkgs.buildEnv {
    name = "nsm-data-analysis-python";
    paths = with pkgs; [
      my-python
    ];
  };
  nsm-data-analysis-go = pkgs.buildEnv {
    name = "nsm-data-analysis-go";
    paths = with pkgs; [
      my-go
    ];
  };
}
