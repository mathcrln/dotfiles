# Sail test with filter
stf() {
  sail artisan test --filter="$1"
}

# Convert opus files to mp3
opus2mp3() {
  for f in "$@"; do
    ffmpeg -y -hide_banner -loglevel error -i "$f" -c:a libmp3lame -b:a 192k "${f%.opus}.mp3"
  done
}
