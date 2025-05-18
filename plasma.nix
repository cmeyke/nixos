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
            # System Settings" ... "KeePassXC" "Obsidian" "Remmina" "Steam" "Document Scanner"
            launchers = [
              "applications:org.kde.dolphin.desktop"
              "applications:firefox.desktop"
              "applications:org.kde.konsole.desktop"
              "applications:steam.desktop"
            ];
          };
        }
        "org.kde.plasma.marginsseparator"
        "org.kde.plasma.systemtray"
        "org.kde.plasma.digitalclock"
        "org.kde.plasma.showdesktop"      ];
    }
  ];

}
