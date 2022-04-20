0="${ZERO:-${${0:#$ZSH_ARGZERO}:-${(%):-%N}}}"
0="${${(M)0:#/*}:-$PWD/$0}"

if [ ! ${command[skaffold]}]; then
  ${0:h}/install-skaffold.sh
fi

