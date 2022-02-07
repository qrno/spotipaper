# spotipaper
Little Bash script for setting your wallpaper to Spotify album covers

### Built with

* **playerctl** - gets the name, artist, and URL to the art of the currently playing album
* **curl** - used to download the image
* **Imagemagick** - used to create the final wallpaper from the cover art
* **feh** - sets the wallpaper to the image
* **watch** - runs the command every couple seconds

The code is really short, I recommend reading it.

### Usage

1. Install the above dependencies if needed
2. Clone the repo
```sh
git clone https://github.com/qrno/spotipaper
```
3. Run it with the Linux **watch** command
```sh
cd spotipaper
watch ./spotipaper.sh
```

### Screenshots

<img src="https://i.imgur.com/L2m9qVM.png" width="600">
<img src="https://i.imgur.com/EiImIq5.png" width="600">
<img src="https://i.imgur.com/eyMLxNl.png" width="600">
<img src="https://i.imgur.com/PdI3SM2.png" width="600">
<img src="https://i.imgur.com/qLJ5ajo.png" width="600">
