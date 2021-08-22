On windows firefox data can be found in `%APPDATA%\Mozilla` (linux `~/.mozilla`). At first files looks similar but in fact structure of files on windows and linux differ a bit. First differences that on windows files have upper cases when on linux all letters are lowercased.

| Winows              | linux               |
| ------------------- | ------------------- |
| Mozilla             | .mozilla            |
| Extensions          | extensions          |
| Firefox             | firefox             |
| SystemExtensionsDev | systemextensionsdev |

Another difference is that in `%APPDATA%\Mozilla\Firefox` Windows creates separated directory for profiles `Profiles` where profile directories are stored when on linux profile directories are stored directly in `~/.mozilla/firefox` (at least in my case). If we paste linux files to windows, change directories names, and move profile directories to `Profiles` directory Firefox will recognize files but wont be able to read them. The only way I could move linux files to Windows with success was:

1. empty Windows` %APPDATA%\Mozilla\` directory
2. run Firefox
3. close it
4. Go to created profile directory `%APPDATA%\Mozilla\Firefox\Profiles\something.default-release-n`
5. delete created files
6. paste files from profile on linux (it was containing directories like `bookmarkbackups`, `browser-extension-data`, `crashes`etc.)

So migrating profiles from linux to windows is not trivial but it is possible. These differences was observed on my PC and it possible that can be much more though. However shell script could be rewritten for Windows and profile changing should work the same way.
