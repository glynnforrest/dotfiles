let
  pkgs = import
    (builtins.fetchTarball {
      url = "https://github.com/NixOS/nixpkgs/archive/refs/tags/24.05.tar.gz";
      sha256 = "1lr1h35prqkd1mkmzriwlpvxcb34kmhc9dnr48gkm8hh089hifmx";
    })
    { config.allowUnfree = true; };

  python = (pkgs.python311.withPackages (ps: [
    ps.black
    ps.click
    ps.flake8
    ps.requests
  ]));
in
pkgs.buildEnv {
  name = "dotfiles";
  paths = with pkgs; [
    nodejs
    php
    python
  ];
}
