function pascal-npm-local-packages() {
  PASCALREPO=$1
  PASCALREPOROOTDIR='.'
  if [ -z "$PASCALREPO" ]; then
    PASCALREPO="astro-swiper"
  fi
  if [ "$PASCALREPO" == "astro-swiper" ]; then
    PASCALREPOROOTDIR="packages/astro-swiper"
  fi
  echo "Packing and installing local packages $PASCALREPO/$PASCALREPOROOTDIR..."
  cd ~/dev/pascal-brand38/astro/$PASCALREPO/$PASCALREPOROOTDIR
  npm pack --pack-destination /tmp
  cd -
}
export -f pascal-npm-local-packages

function pascal-npminstall-local-packages() {
  pascal-npm-local-packages $1
  npm uninstall $PASCALREPO
  npm add /tmp/$PASCALREPO-*.tgz
  rm /tmp/$PASCALREPO-*.tgz
}
export -f pascal-npminstall-local-packages

function pascal-pnpminstall-local-packages() {
  pascal-npm-local-packages $1
  pnpm uninstall $PASCALREPO
  pnpm add --prefer-offline=true /tmp/$PASCALREPO-*.tgz
  rm /tmp/$PASCALREPO-*.tgz
}
export -f pascal-pnpminstall-local-packages
