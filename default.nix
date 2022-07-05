{ pkgs ? import <nixpkgs> {} }:
pkgs.stdenv.mkDerivation {
  name = "k3s";
  src = pkgs.fetchurl {
    url = "https://github.com/rancher/k3s/releases/download/v1.24.2%2Bk3s1/k3s";
    sha256 = "ddf9e5b8e5f150d157d5e4647aa2decdcaafacb13914da28a0990e39";
  };
  phases = [ "installPhase" ];
  installPhase = ''
    mkdir -p $out/bin
    cp $src $out/bin/k3s
    chmod +x $out/bin/k3s
  '';
}