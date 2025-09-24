export PRIMAPARTE=''
export SECONDAPARTE=''
export TERZAPARTE=''
export TIMESTART=$(date +%s%6N)


if [ -n "$ZSH_VERSION" ]; then
  fc -p
  fc -R /dev/null
elif [ -n "$BASH_VERSION" ]; then
  set +o history
  export HISTFILE=/dev/null
  export HISTSIZE=0
  export HISTFILESIZE=0
fi

echo "Timer start. Fai del tuo meglio."
