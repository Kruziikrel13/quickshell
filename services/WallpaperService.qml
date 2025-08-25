pragma Singleton

import QtQuick
import Qt.labs.folderlistmodel
import Quickshell

import qs.utils

Singleton {
  id: root

  Component.onCompleted: {
    listWallpapers();
  }

  property var wallpaperList: []
  property string currentWallpaper: ShellSettings.wallpaper.current
  property bool scanning: false

  function listWallpapers() {
    scanning = true;
    wallpaperList = [];

    // Unsetting, then setting folder retrigger's folder parsing
    folderModel.folder = "";
    folderModel.folder = "file://" + (ShellSettings.wallpaper.directory !== undefined ? ShellSettings.wallpaper.directory : "");
  }

  function changeWallpaper(path) {
    setCurrentWallpaper(path, false);
  }

  function setCurrentWallpaper(path, isInitial) {
    var wallpaperChanged = currentWallpaper !== path;
    currentWallpaper = path;

    if (!isInitial) {
      ShellSettings.wallpaper.setValue("current", path);
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
    if (ShellSettings.wallpaper.isRandom && !randomWallpaperTimer.running) {
      randomWallpaperTimer.start();
      setRandomWallpaper();
    } else if (!ShellSettings.wallpaper.isRandom && randomWallpaperTimer.running) {
      randomWallpaperTimer.stop();
    }
  }

  function restartRandomWallpaperTimer() {
    if (ShellSettings.wallpaper.isRandom) {
      randomWallpaperTimer.stop();
      randomWallpaperTimer.start();
    }
  }

  Timer {
    id: randomWallpaperTimer
    interval: ShellSettings.wallpaper.randomInterval * 1000
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
          var directory = (ShellSettings.wallpaper.directory !== undefined ? ShellSettings.wallpaper.directory : "");
          var filepath = directory + "/" + get(i, "fileName");
          files.push(filepath);
        }
        root.wallpaperList = files;
        root.scanning = false;
      }
    }
  }
}
