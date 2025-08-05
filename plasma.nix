{

  programs.plasma = {
    enable = true;
  };

  programs.plasma.panels = [
    {
      widgets = [
        "org.kde.plasma.kickoff"
        "org.kde.plasma.pager"
        {
          iconTasks = {
            launchers = [
              "applications:kdesystemsettings.desktop"
              "applications:org.kde.dolphin.desktop"
              "applications:brave-browser.desktop"
              "applications:firefox.desktop"
              "applications:org.kde.konsole.desktop"
              "applications:org.keepassxc.KeePassXC.desktop"
              "applications:obsidian.desktop"
              "applications:org.remmina.Remmina.desktop"
              "applications:steam.desktop"
              "applications:simple-scan.desktop"
              "applications:msty.desktop"
              "applications:guvcview.desktop"
              "applications:Zoom.desktop"
              "applications:org.kde.spectacle.desktop"
            ];
          };
        }
        "org.kde.plasma.marginsseparator"
        "org.kde.plasma.systemtray"
        "org.kde.plasma.digitalclock"
        "org.kde.plasma.showdesktop"
      ];
    }
  ];

}
