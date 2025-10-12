//@ pragma Internal

import QtQuick
import Quickshell
import Quickshell.Services.Pam

Scope {
  id: root

  signal unlocked
  signal failed

  property bool unlockInProgress: false
  property string currentText: ""

  function clearText() {
    root.currentText = "";
  }

  function reset() {
    root.clearText();
    root.unlockInProgress = false;
  }

  Timer {
    id: clearTimer
    interval: 10000
    onTriggered: root.reset()
  }

  onCurrentTextChanged: {
    clearTimer.restart();
  }

  function tryUnlock() {
    root.unlockInProgress = true;
    pam.start();
  }

  PamContext {
    id: pam
    // pam_unix driver will require a response for the password prompt
    onPamMessage: {
      if (this.responseRequired)
        this.respond(root.currentText);
    }

    onCompleted: res => {
      if (res === PamResult.Success)
        root.unlocked();
      else
        root.failed();

      root.unlockInProgress = false;
    }

    // Emitted if PAM encounters a non standard error (i.e. not just a wrong password)
    onError: {
      // TODO: Notification popup with error message (this.message)
      root.unlockInProgress = false;
      root.failed();
    }
  }
}
