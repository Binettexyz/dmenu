{ stdenv, lib, libX11, libXft, libXinerama }:

with lib;

stdenv.mkDerivation {
  name = "dwm-head";

  src = builtins.filterSource
    (path: type: (toString path) != (toString ./.git)) ./.;

  buildInputs = [ libX11 libXft libXinerama ];

  prePatch = ''
    substituteInPlace config.mk --replace '/usr/local' $out
  '';

  meta = {
    description = "X's dynamic menu";
    homepage = https://tools.suckless.org/dmenu/;
    license = licenses.mit;
    platforms = platforms.all;
  };
}
