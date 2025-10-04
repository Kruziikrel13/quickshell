pragma Singleton

import QtQuick
import Qt.labs.folderlistmodel
import Quickshell

Singleton {
  id: root

  readonly property string defaultWallpaper: "nebula.jpg"
  readonly property string defaultDirectory: Qt.resolvedUrl(Quickshell.env("HOME") + "/Pictures/Wallpapers/")
  property bool isRandom: false
  property int randomInterval: 300 // in seconds
  onDefaultDirectoryChanged: WallpaperService.listWallpapers()
  onIsRandomChanged: WallpaperService.toggleRandomWallpaper()
  onRandomIntervalChanged: WallpaperService.restartRandomWallpaperTimer()

  Component.onCompleted: {
    listWallpapers();
  }

  property var wallpaperList: []
  property string currentWallpaper: defaultWallpaper
  property bool scanning: false

  function getWallpaperPath() {
    return defaultDirectory + currentWallpaper;
  }

  function listWallpapers() {
    scanning = true;
    wallpaperList = [];

    // Unsetting, then setting folder retrigger's folder parsing
    folderModel.folder = "";
    folderModel.folder = "file://" + (defaultDirectory);
  }

  function changeWallpaper(path) {
    setCurrentWallpaper(path, false);
  }

  function setCurrentWallpaper(path, isInitial) {
    var wallpaperChanged = currentWallpaper !== path;
    currentWallpaper = path;

    if (!isInitial) {
      currentWallpaper = path;
    }

    if (randomWallpaperTimer.running) {
      randomWallpaperTimer.restart();
    }
  }

  function setRandomWallpaper() {
    var randomIndex = Math.floor(Math.random() * wallpaperList.length);
    var randomPath = wallpaperList[randomIndex];
    if (!randomPath)
      return;
    setCurrentWallpaper(randomPath, false);
  }

  function toggleRandomWallpaper() {
    if (isRandom && !randomWallpaperTimer.running) {
      randomWallpaperTimer.start();
      setRandomWallpaper();
    } else if (!isRandom && randomWallpaperTimer.running) {
      randomWallpaperTimer.stop();
    }
  }

  function restartRandomWallpaperTimer() {
    if (isRandom) {
      randomWallpaperTimer.stop();
      randomWallpaperTimer.start();
    }
  }

  Timer {
    id: randomWallpaperTimer
    interval: root.randomInterval * 1000
    running: false
    repeat: true
    onTriggered: root.setRandomWallpaper()
    triggeredOnStart: false
  }

  FolderListModel {
    id: folderModel
    nameFilters: ["*.jpg", "*.jpeg", "*.png", "*.gif", "*.pnm", "*.bmp"]
    showDirs: false
    sortField: FolderListModel.Name
    onStatusChanged: {
      if (status === FolderListModel.Ready) {
        var files = [];
        for (var i = 0; i < count; i++) {
          var directory = (root.defaultDirectory !== undefined ? root.defaultDirectory : "");
          var filepath = directory + "/" + get(i, "fileName");
          files.push(filepath);
        }
        root.wallpaperList = files;
        root.scanning = false;
      }
    }
  }
}
