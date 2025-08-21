pragma Singleton
import Quickshell

Singleton {
  id: root

  PersistentProperties {
    id: globalPersistence

    property bool showPowerMenu: false
  }

  property alias showPowerMenu: globalPersistence.showPowerMenu
  function powermenu(arg: string): void {
    switch (arg) {
    case "open": // open
      globalPersistence.showPowerMenu = true;
      break;
    case "close": // close
      globalPersistence.showPowerMenu = false;
      break;
    case "toggle": // toggle
      globalPersistence.showPowerMenu = !globalPersistence.showPowerMenu;
      break;
    default:
      console.warn("Invalid argument for powermenu function:", arg);
    }
  }
}
