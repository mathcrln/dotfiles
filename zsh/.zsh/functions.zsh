# Sail test with filter
stf() {
  ./vendor/bin/sail artisan test --filter="$1"
}

sam() {
  ./vendor/bin/sail artisan make:$1 "${@:2}"
}

# Convert opus files to mp3
# opus2mp3() {
#   for f in "$@"; do
#     ffmpeg -y -hide_banner -loglevel error -i "$f" -c:a libmp3lame -b:a 192k "${f%.opus}.mp3"
#   done
# }
