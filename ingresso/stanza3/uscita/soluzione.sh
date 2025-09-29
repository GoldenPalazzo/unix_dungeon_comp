#!/bin/sh

if [ "$PRIMAPARTE" = "" ]
then
	echo
	echo 'La $PRIMAPARTE è mancante!'
	echo 'Ritorna quando sarai pronto.'
	echo
	exit 1
fi


if [ "$SECONDAPARTE" = "" ]
then
	echo
	echo 'La $SECONDAPARTE è mancante!'
	echo 'Ritorna quando sarai pronto.'
	echo
	exit 1
fi


if [ "$TERZAPARTE" = "" ]
then
	echo
	echo 'La $TERZAPARTE è mancante!'
	echo 'Ritorna quando sarai pronto.'
	echo
	exit 1
fi


FRASE="$PRIMAPARTE $SECONDAPARTE $TERZAPARTE"

echo
echo "La frase che hai trovato è: $FRASE"
echo


CRYPTED=`echo "$FRASE" | md5sum | awk '{print $1}'`


if [ "$CRYPTED" = "7d68305f41f57b7d5e028168f632d585" ]
then

	echo
	echo "La soluzione è esatta!"
	echo
	echo "Ora sei pronto per iniziare la tua carriera di MAGO UNIX :-)"
	echo
	cat << 'HEREDOC'
                             /\
                            /  \
                           |    |
                         --:'''':--
                           :'_' :
                           _:"":\___
            ' '      ____.' :::     '._
           . *=====<<=)           \    :
            .  '      '-'-'\_      /'._.'
                             \====:_ ""
                            .'     \\
                           :       :
                          /   :    \
                         :   .      '.
         ,. _        snd :  : :      :
      '-'    ).          :__:-:__.;--'
    (        '  )        '-'   '-'
 ( -   .00.   - _
(    .'  _ )     )
'-  ()_.\,\,   -

HEREDOC

    if [ "$TIMESTART" != "" ]
    then
        TIMEEND=`date +%s%6N`
        DIFFTIME=`expr $TIMEEND - $TIMESTART`
        echo "Hai impiegato $DIFFTIME microsecondi per trovare la soluzione."
        echo "Caricherò il tuo punteggio sul server..."
        read -p "Inserisci il tuo username: " USERNAME_PROMPT
        USERNAME_CLEAN=`echo "$USERNAME_PROMPT" | sed 's/[[:space:]]//g'`

        SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
        THREE_UP="$(dirname "$(dirname "$(dirname "$SCRIPT_DIR")")")"
        EXCLUDE_LIST="$THREE_UP/.exclude_list.txt"
        CHKSUM_CMD="find . -type f -print0 | grep -z -v -f ${EXCLUDE_LIST} | xargs -0 sha256sum | sort | sha256sum"
        CHKSUM=$(cd "$THREE_UP" && eval "$CHKSUM_CMD" | awk '{print $1}')
        SITE="http://francescopalazzo.net"
        if [ "$1" = "test" ]
        then
            SITE="http://localhost:8080"
        fi
        JSON_PAYLOAD=$(jq -n --arg user "$USERNAME_CLEAN" --arg time "$DIFFTIME" --arg chksum "$CHKSUM" '{username: $user, time_us: $time, chksum: $chksum}')
        RESPONSE=$(curl -s --request POST --header "Content-Type: application/json" --data "$JSON_PAYLOAD" $SITE/save)
        echo $RESPONSE | jq -r .msg
    fi

	exit 0
else

	echo
	echo "La soluzione è errata!"
	echo "Cerca ancora."
	echo
	exit 1
fi























































































# Questo è un file di testo "speciale".
#
# A differenza degli altri file di testo, ha i permessi di esecuzione ("x"),
# e contiene una sequenza di comandi interpretabili dalla shell.
#
