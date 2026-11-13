# DeskPet — tap Homebrew

Un cucciolo (gattino, papera o emu) che vive sul Dock del Mac: covi l'uovo, lo fai crescere e lo mandi a trovare i colleghi.

```sh
brew tap clickforgesupport-bot/deskpet
brew trust clickforgesupport-bot/deskpet
brew install --cask deskpet
```

`brew trust` serve una volta sola: dalle versioni recenti Homebrew chiede di confermare i tap di terze parti.

Aggiornamenti: `brew upgrade --cask deskpet`. Disinstallazione: `brew uninstall --cask deskpet` (con `--zap` cancella anche il pet salvato).

Download diretto e istruzioni: https://deskpet-dev.clickforge.workers.dev/download
