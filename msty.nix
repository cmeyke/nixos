{
  appimageTools,
  fetchurl,
}: let
  pname = "msty";
  version = "1.9";
  src = fetchurl {
    url = "https://assets.msty.app/prod/latest/linux/amd64/Msty_x86_64_amd64.AppImage"
    sha256 = "";
  };
  appimageContents = appimageTools.extractType2 {
    inherit pname version src;
  };
in 
  appimageTools.wrapType2 {
    inherit pname version src;
    extraInstallCommands = ''
      install -m 444 -D ${appimageContents}/${pname}.desktop $out/share/applications
      substituteInPlace $out/share/applications/${pname}.desktop \
        --replace 'Exec=AppRun' 'Exec=${pname}'
      install -m 444 -D ${appimageContents}/${pname}.png $out/share/icons/hicolor/256x256/apps/${pname}.png
    '';
  }
