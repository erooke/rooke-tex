{ stdenv, texlive }:

let
  rooke-tex = stdenv.mkDerivation {
    name = "latex-rooke";
    pname = "latex-rooke";
    version = "0.0.1";
    tlType = "run";

    src = ./src;

    phases = [ "unpackPhase" "installPhase" ];

    installPhase = ''
      path="$out/tex/latex"
      mkdir -p "$path"
      cp *.{cls,sty} "$path"
    '';
  };
in
{
  pkgs = builtins.concatLists [
    [ rooke-tex ]
    texlive.memoir.pkgs
    texlive.algorithms.pkgs
    texlive.etoolbox.pkgs
    texlive.fancyhdr.pkgs
    texlive.enumitem.pkgs
    texlive.siunitx.pkgs
    texlive.algorithmicx.pkgs
    texlive.mathtools.pkgs
    texlive.amsfonts.pkgs
    texlive.amscls.pkgs
    texlive.jknapltx.pkgs
    texlive.rsfs.pkgs
    texlive.pgf.pkgs
    texlive.ifetex.pkgs
  ];
}
