pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Services.Pipewire

Singleton {
  id: root

  readonly property var nodes: Pipewire.nodes.values.reduce((acc, node) => {
    if (!node.isStream) {
      if (node.isSink) {
        acc.sinks.push(node);
      } else if (node.audio) {
        acc.sources.push(node);
      }
    }
    return acc;
  }, {
    "sources": [],
    "sinks": []
  })
  readonly property list<PwNode> sinks: nodes.sinks
  readonly property list<PwNode> sources: nodes.sources

  readonly property PwNode sink: Pipewire.defaultAudioSink
  readonly property PwNode source: Pipewire.defaultAudioSource

  // Getters / Setters for Audio
  readonly property alias volume: root._volume
  property real _volume: sink?.audio?.volume ?? 0

  readonly property alias muted: root._muted
  property bool _muted: !!sink?.audio?.muted

  readonly property alias inputVolume: root._inputVolume
  property real _inputVolume: source?.audio?.volume ?? 0

  readonly property alias inputMuted: root._inputMuted
  property bool _inputMuted: !!source?.audio?.muted

  readonly property real stepVolume: 5 / 100.0

  PwObjectTracker {
    objects: [root.sink, root.source]
  }

  // Safely update audio fields
  Connections {
    target: root.sink?.audio ? root.sink?.audio : null

    function onVolumeChanged() {
      var vol = (root.sink?.audio?.volume ?? 0);
      if (isNaN(vol)) {
        vol = 0;
      }

      root._volume = vol;
    }

    function onMutedChanged() {
      root._muted = (root.sink?.audio.muted ?? true);
    //TODO: Add popup notification for muted
    }
  }

  Connections {
    target: root.source?.audio ? root.source?.audio : null

    function onVolumeChanged() {
      var vol = (root.source?.audio?.volume ?? 0);
      if (isNaN(vol)) {
        vol = 0;
      }
      root._inputVolume = vol;
    }

    function onMutedChanged() {
      root._inputMuted = (root.source?.audio.muted ?? true);
    //TODO: Add popup notification for muted
    }
  }

  function increaseVolume() {
    setVolume(volume + stepVolume);
  }

  function decreaseVolume() {
    setVolume(volume - stepVolume);
  }

  function setVolume(newVolume: real) {
    if (sink?.ready && sink?.audio) {
      // Clamp it accordingly
      sink.audio.muted = false;
      sink.audio.volume = Math.max(0, Math.min(1.0, newVolume));
    } else {
      //TODO: Add notification for no sink available
      console.log("No sink available");
    }
  }

  function setOutputMuted(muted: bool) {
    if (sink?.ready && sink?.audio) {
      sink.audio.muted = muted;
    } else {
      //TODO: Add notification for no sink available
      console.log("No sink available");
    }
  }

  function increaseInputVolume() {
    setInputVolume(inputVolume + stepVolume);
  }

  function decreaseInputVolume() {
    setInputVolume(inputVolume - stepVolume);
  }

  function setInputVolume(newVolume: real) {
    if (source?.ready && source?.audio) {
      // Clamp it accordingly
      source.audio.muted = false;
      source.audio.volume = Math.max(0, Math.min(1.0, newVolume));
    } else {
      //TODO: Add notification for no sink available
      console.log("No sink available");
    }
  }

  function setInputMuted(muted: bool) {
    if (source?.ready && source?.audio) {
      source.audio.muted = muted;
    } else {
      //TODO: Add notification for no sink available
      console.log("No sink available");
    }
  }

  function setAudioSink(newSink: PwNode): void {
    Pipewire.preferredDefaultAudioSink = newSink;
    // Volume is changed by the sink change
    root._volume = newSink?.audio?.volume ?? 0;
    root._muted = !!newSink?.audio?.muted;
  }

  function setAudioSource(newSource: PwNode): void {
    Pipewire.preferredDefaultAudioSource = newSource;
    // Volume is changed by the source change
    root._inputVolume = newSource?.audio?.volume ?? 0;
    root._inputMuted = !!newSource?.audio?.muted;
  }
}
