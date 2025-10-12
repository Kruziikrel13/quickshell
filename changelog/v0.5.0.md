## New Features

- Added initial implementation of lock screen
- Added idle service for automatically locking and suspending the computer

### Other Features
- Added laptop battery widget to bar module

## Other Changes

- Load wallpapers from ~/Pictures/Wallpapers
- Removed wallpaper configuration from settings.ini
- Rewritten audio service for safer and cleaner audio updates / tracking
- Cleaned up top level of config by migrating ShellSettings -> common/Settings and GlobalStates -> common/GlobalState
- Addition of initialLoad / state handling and persistent properties for lockScreen and initialLoad in GlobalState

