# Sail test with filter
stf() {
  ./vendor/bin/sail artisan test --filter="$1"
}

sdev() {
  concurrently -k \
    -c "#93c5fd,#c4b5fd,#d4d4d8,#fdba74" \
    "pnpm run dev" \
    "./vendor/bin/sail artisan queue:listen --tries=1" \
    "./vendor/bin/sail artisan pail" \
    "./vendor/bin/sail artisan schedule:work" \
    --names=vite,queue,logs,scheduler
}

# Convert opus files to mp3
opus2mp3() {
  for f in "$@"; do
    ffmpeg -y -hide_banner -loglevel error -i "$f" -c:a libmp3lame -b:a 192k "${f%.opus}.mp3"
  done
}
