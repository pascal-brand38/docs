____________________________
# Visual Studio Code

## Settings
Open menu File → Preferences → Settings → User Settings tab, and check the following
* files: trim trailing whitespace
* files: trim final newlines
* editor.detectIndentation to true
* files Text Editor: eol \n (which is linux)


Command Palette (CTL-SHIFT-P), and then:
* Python: Select Interpreter ==> C:\msys64\mingw64\bin\python.exe
  (see answer of https://stackoverflow.com/questions/70795319/no-module-named-pil-visual-studio-code-error/77189429)

## Extension

* Live Server
* Even Better TOML
* Github Actions
* Pylance
* webhint



____________________________
# Libreoffice

## Forms
* Open Libreoffice writter
* Choose `ott` format. When reopening, using `Open`, and not the default `New`
* `[Affichage][Barre d'outils][Contrôle de formulaire]`
* `[Mode conception]`
* Export to pdf


Unfortunately, the pdf has some errors, that can be highlighted
with Acrobat Acrobat (disable wifi access)

<table>
<tbody>
<tr>
<td>
<ul>
<li> Use tool `Prepress` (`Preflight in english`) </li>
<li> Click on `Controle en Amont` </li>
<li> Select `Rapport sur les problèmes de syntaxe PDF` </li>
<li> Click on `Analyse` </li>
<li> Here are typical errors: </li>
</td>

<td>
<img src="https://raw.githubusercontent.com/pascal-brand38/pascal-brand38/main/windows/pdf-errors.png"/>
</td>
</tr>
</tbody>
</table>


To correct errors using Acrobat Reader, save it as `PDF/A 1a`, as in the following:
![](https://raw.githubusercontent.com/pascal-brand38/pascal-brand38/main/windows/pdf-save-pdfA-1a.png)

With prepress, this is now possible to check there are no PDF synatx errors

![](https://raw.githubusercontent.com/pascal-brand38/pascal-brand38/main/windows/pdf-correct.png)

The resulting pdf could then being optimized and reduced using Orpalis Pdf Reducer 3.

There are 2 other ways to check the pdf is not that bad:
* https://www.pdf-online.com/osa/validate.aspx
* Run `/c/Program\ Files/gs/gs10.00.0/bin/gswin64.exe -r36x36 file.pdf`
  and look at the gostscript console the Helevetica font is not
  loaded several times,...

Note that the following npm package are way too simple
(look for count page,...):
* https://www.npmjs.com/package/is-pdf-valid
* https://www.npmjs.com/package/@ninja-labs/verify-pdf
* https://www.npmjs.com/package/ghostscript-node

## Edit macros in Visual Studio Code
From https://www.youtube.com/watch?v=xoO-Fx0fTpM&ab_channel=xlwings

MUST BE INSTALLED ON WINDOWS or MACOS. No MINGW32.

https://docs.xlwings.org/en/stable/installation.html

From WinPython, portable version of python

Run WinPython Command Prompt.exe - Raccourci
pip install --upgrade xlwings
pip install watchgod
xlwings vba edit


```
python -m pip install xlwings
xlwings
```



Force pnpm usage:
```json
"scripts": {
  "preinstall": "npx only-allow pnpm",
}
```

<br>

____________________________
# Acrobat Reader

## Forms

Open the pdf, then more tools to choose Prepare the form.
And you now have access to all the fields

<br>

____________________________
# Thunderbird

* Solve Temps limite de connexion au serveur IMAP.GMAIL.COM dépassé (cf. https://forums.mozfr.org/viewtopic.php?t=150821)
```
Paramètre > Editeur de configuration
Filtre : écrire : timeout
Chercher la ligne : mailnews.tcptimeout
Augmenter sa valeur : mettre 600
Redémarrer TB
```

* Import mbox file: </br>
  Use *ImportExportTools NG* add-in

* Signature --:
  Parameters > General > Editeur de configuration > mail.identity.default.suppress_signature_separator = true

<br>

____________________________
# Gmail

* Find all emails that have no labels at all: </br>
  **has:nouserlabels**

* Find huge emails: </br>
  **larger:5M**

* Find without attachments: </br>
  **!has:attachment**

* Find by dates: <br>
  **before:2020-01-01**

<br>


# Github

Search for the PR I sibmitted, but not in my own repo:
* is:pr author:pascal-brand38 -user:pascal-brand38

git remote add webtools git@github.com:pascal-brand38/webtools-helper.git
git fetch --all
git checkout remotes/origin/webtools
git checkout -b webtools
git checkout main
git mv README.md README-org.md
git cherry-pick ..webtools



Push a change to an existing PR made by apatel369:patch-2 on astro.build
git remote add apatel369 git@github.com:apatel369/astro.build.git
git fetch apatel369
git checkout -b patch-2 remotes/apatel369/patch-2



Splitting a subfolder out into a new repository
https://docs.github.com/en/get-started/using-git/splitting-a-subfolder-out-into-a-new-repository

python -m pip install git_filter_repo
git clone ...
cd repo
python  /c/msys64/mingw64/lib/python3.11/site-packages/git_filter_repo.py --subdirectory-filter FOLDER-NAME


____________________________
# DOS / Windows

* Clean empty data of disk c
```
cipher /w:c
```

* Adding right-click command:
In regedit, add the following (%1 is the file that is right-clicked, %w is its directory)
```
   HKEY_CLASSES_ROOT\*\shell\My New Command\Command
   default is
        C:\msys64\msys2_shell.cmd -mingw64 -c 'python  mybin.py "--file=$0" "--dir=$1"'  "%1" "%w"
```

<br>

____________________________
# Browser

## [IE11 on Windows-11](https://www.tomsguide.fr/windows-11-internet-explorer-respire-encore-voici-comment-louvrir/)

* Tapez Options Internet dans la barre de recherche du menu Démarrer.
* Ouvrez l’applet du Panneau de configuration qui apparaît dans les résultats.
* Trouvez l’onglet Programmes puis cliquez sur Gérer les modules complémentaires.
* Cliquez enfin sur En savoir plus sur les barres d’outils et les extensions dans le coin inférieur gauche de la fenêtre.
* Pour une raison étrange, cela lancera Internet Explorer en contournant les commandes qui vous dirigent de force sur Edge.

## Older version of chrome
* NO: https://vikyd.github.io/download-chromium-history-version/#/

____________________________
# ffmpeg
For example, to trim from the 5-second mark to the 9-second mark:

```ffmpeg -ss 00:00:05 -to 00:00:09 -i myclip.mp4 trimmed_to.mp4```

## avi to mkv
```
ffmpeg -loglevel quiet -fflags +genpts -i D.1x02.avi -c:v copy -c:a copy D.1x02.mkv

for file in *.avi */*.avi; do
  target="${file%.*}.mkv"
  echo Processing "$file" to "$target"
  ffmpeg -loglevel quiet -fflags +genpts -i "$file" -c:v copy -c:a copy "$target"
done
```

____________________________
# Misc.

## Misc. actions

* svg to png: using Photoshop, open the svg, and set resolution to
  1200dpi or higher on initial pixellisation step

## Misc. app
* [MusicBrainz Picard](https://picard.musicbrainz.org/)
* CopyTrans Control Center / CopyTrans Manager
* AndreaMosaic
* Faststone Image Viewer
* Filezilla
* CCleaner
* Defraggler
* Recuva
* 7zip
* ImageMagik
* CrystalDiskInfo
* Libreoffice
* MalewareBytes
* PdfXChangeViewer
* Httrack
* FreeFileSync portable
* PdfReducerPro Portable
* OpenShot Video
* notepad++
* Visual Studio Code
* Paint.net
* Media Player Classic Home Cinema
