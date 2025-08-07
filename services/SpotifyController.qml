pragma Singleton
pragma ComponentBehavior: Bound
import QtQuick
import Quickshell
import Quickshell.Services.Mpris

Singleton {
  id: root
  readonly property MprisPlayer _spotifyinstance: Mpris.players.values.find(player => player.identity == "Spotify") ?? null
  readonly property bool active: _spotifyinstance != null
  signal spotifyOpened
  signal spotifyClosed
  signal trackChanged

  property var activeTrack: null
  property bool isPlaying: this._spotifyinstance && this._spotifyinstance.isPlaying

  Connections {
    target: root
    function on_SpotifyinstanceChanged() {
      if (root._spotifyinstance != null) {
        root.spotifyOpened();
      } else {
        root.spotifyClosed();
      }
    }
  }

  function updateTrack() {
    this.activeTrack = {
      uniqueId: this._spotifyinstance?.uniqueId ?? 0,
      artUrl: this._spotifyinstance?.trackArtUrl ?? "",
      title: this._spotifyinstance?.trackTitle ?? "Unknown Title",
      artist: this._spotifyinstance?.trackArtist ?? "Unknown Artist",
      album: this._spotifyinstance?.trackAlbum ?? "Unknown Album"
    };
    this.trackChanged();
  }

  Loader {
    active: root.active
    sourceComponent: Connections {
      target: root._spotifyinstance

      Component.onCompleted: {
        root.updateTrack();
      }

      Component.onDestruction: {
        root.activeTrack = null;
      }

      function onPostTrackChanged() {
        root.updateTrack();
      }

      function onTrackArtUrlChanged() {
        if (root._spotifyinstance.uniqueId === root.activeTrack.uniqueId && root._spotifyinstance.trackArtUrl !== root.activeTrack.artUrl) {
          root.updateTrack();
        }
      }
    }
  }
}
