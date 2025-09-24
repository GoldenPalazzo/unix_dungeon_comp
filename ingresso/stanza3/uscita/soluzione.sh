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

        HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "http://francescopalazzo.net/save/$(whoami)/$DIFFTIME")

        if [ "$HTTP_CODE" -ne 200 ]; then
            echo "Errore: impossibile caricare il punteggio sul server."
        else
            echo "Punteggio caricato con successo!"
        fi
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
