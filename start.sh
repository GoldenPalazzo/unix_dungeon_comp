#!/bin/sh
export PRIMAPARTE=''
export SECONDAPARTE=''
export TERZAPARTE=''
export TIMESTART=`date +%s%6N`

set +o history
export HISTFILE=/dev/null
export HISTSIZE=0
export HISTFILESIZE=0

echo "Timer start. Fai del tuo meglio."
