//@ pragma Internal

import Quickshell
import Quickshell.Services.Pam

Scope {
  id: root

  signal unlocked
  signal failed

  property string currentText: ""
  property bool unlockInProgress: false
  property bool showFailure: false
  property string errorMessage: ""
  property string infoMessage: ""
  property bool pamAvailable: typeof PamContext !== "undefined"

  onCurrentTextChanged: {
    if (currentText !== "") {
      showFailure = false;
      errorMessage = "";
    }
  }

  function tryUnlock() {
    if (!pamAvailable) {
      errorMessage = "PAM module not available";
      showFailure = true;
      return;
    }

    root.unlockInProgress = true;
    errorMessage = "";
    showFailure = false;

    pam.start();
  }

  PamContext {
    id: pam
    user: Quickshell.env("USER")

    onPamMessage: {
      if (messageIsError) {
        root.errorMessage = message;
      } else {
        root.infoMessage = message;
      }

      if (responseRequired) {
        respond(root.currentText);
      }
    }

    onResponseRequiredChanged: {
      if (responseRequired && root.unlockInProgress) {
        respond(root.currentText);
      }
    }

    onCompleted: res => {
      if (res === PamResult.Success) {
        root.unlocked();
      } else {
        root.errorMessage = "Authentication failed";
        root.showFailure = true;
        root.failed();
      }

      root.unlockInProgress = false;
    }

    onError: {
      root.errorMessage = message || "Authentication error";
      root.showFailure = true;
      root.unlockInProgress = false;
      root.failed();
    }
  }
}
