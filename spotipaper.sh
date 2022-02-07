XRES=1920
YRES=1080
DIR=/tmp/spotipaper

if [ ! -d $DIR ]; then
  mkdir $DIR
fi

CURRENT_ALBUM=$DIR/current.txt
LAST_ALBUM=$DIR/last.txt

if [ ! -f $LAST_ALBUM ]; then
  touch $LAST_ALBUM
fi

playerctl metadata --player=spotify \
  -f "{{xesam:album}} - {{xesam:albumArtist}}" > $CURRENT_ALBUM

if cmp --silent -- "$CURRENT_ALBUM" "$LAST_ALBUM"; then
  echo "Album didn't change: $(cat $CURRENT_ALBUM)"
  exit 0
fi

cp $CURRENT_ALBUM $LAST_ALBUM
artUrl=$(playerctl metadata mpris:artUrl --player spotify) 
curl $artUrl -o $DIR/cover.png
sleep 0.1

convert $DIR/cover.png \
  -blur 0x8 \
  -modulate 90,120,100 \
  -resize ${XRES}x${YRES}^ \
  -gravity center \
  -extent ${XRES}x${YRES} \
  $DIR/cover_blurred.png

composite -gravity center \
  $DIR/cover.png \
  $DIR/cover_blurred.png \
  $DIR/background.png

feh --bg-max $DIR/background.png
