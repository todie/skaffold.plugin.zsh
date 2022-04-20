#!/bin/bash

BOLD="$(tput bold 2>/dev/null || printf '')"
GREY="$(tput setaf 0 2>/dev/null || printf '')"
UNDERLINE="$(tput smul 2>/dev/null || printf '')"
RED="$(tput setaf 1 2>/dev/null || printf '')"
GREEN="$(tput setaf 2 2>/dev/null || printf '')"
YELLOW="$(tput setaf 3 2>/dev/null || printf '')"
BLUE="$(tput setaf 4 2>/dev/null || printf '')"
MAGENTA="$(tput setaf 5 2>/dev/null || printf '')"
NO_COLOR="$(tput sgr0 2>/dev/null || printf '')"

pinfo() {
  printf '%s\n' "${BOLD}${GREY}>${NO_COLOR} $*"
}

pwarn() {
  printf '%s\n' "${YELLOW}! $*${NO_COLOR}"
}

perror() {
  printf '%s\n' "${RED}x $*${NO_COLOR}" >&2
}

pcompleted() {
  printf '%s\n' "${GREEN}✓${NO_COLOR} $*"
}

BINDIR=~/.local/bin

if [ -f "$BINDIR/skaffold" ]; then
  perror "$BINDIR/skaffold already exists, delete to reinstall"
  exit
fi

OS="$(uname | tr '[:upper:]' '[:lower:]')"
ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')"
TMPDIR="$(mktemp -d -t install-skaffold.XXXXXX)"

pinfo "Installing skaffold, OS: ${OS}, ARCH: ${ARCH}, TMPDIR: ${UNDERLINE}${TMPDIR}${NO_COLOR}"

(
  set -e
  trap 'perror $LINENO' ERR
  skaffold="skaffold-${OS}-${ARCH}"
  curl -sfL "https://storage.googleapis.com/skaffold/builds/latest/${skaffold}" -o "${BINDIR}/skaffold"
  pcompleted "Succesfully installed skaffold to ${UNDERLINE}${BINDIR}/skaffold${NO_COLOR}"
)
