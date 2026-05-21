# Sail test with filter
stf() {
  ./vendor/bin/sail artisan test --filter="$1"
}

sam() {
  ./vendor/bin/sail artisan make:$1 "${@:2}"
}

wip() {
  git diff --name-status @{upstream}..HEAD -- "$@" | awk '
    /^A/  { printf "\033[32m  + %s\033[0m\n", $2 }
    /^D/  { printf "\033[31m  - %s\033[0m\n", $2 }
    /^M/  { printf "\033[33m  ~ %s\033[0m\n", $2 }
    /^R/  { printf "\033[36m  → %s (from %s)\033[0m\n", $3, $2 }
    /^C/  { printf "\033[35m  ⊕ %s (from %s)\033[0m\n", $3, $2 }
  '
}