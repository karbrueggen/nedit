#!/bin/bash

echo "*******************************************************************"
echo "*		name		nedit.sh Ver. 0.1		  *"
echo "*		author		Julien Deseke-Wendt,			*"
echo "*				GNS Systems GmbH, Braunschweig		*"
echo "*									*"
echo "*		created		Fr 05. Jan 12:46:28 CET 2017		*"
echo "*		last change	Fr 05. Jan 13:43:55 CET 2017		*"
echo "*		description	Nedit Numblock fix	*"
echo "*				on Linux		*"
echo "*									*"
echo "*******************************************************************"

## Set variable APPLICATION, FIX und ORIG
APPLICATION=/usr/bin/nedit.binary

# Two files must be created. You have to set the path by yourself
FIX=/<pfad>/<zu>/xmodmap-fix
ORIG=/<pfad>/<zu>/xmodmap-orig

## Fix
# xmodmap legt nun *Systemweit für alle Applikationen* die Einstellungen für den Numpad Fix an. 
xmodmap $FIX

# startet Nedit und legt ein File an.
$APPLICATION "$@" &

# Wir warten eine Sekunde...
sleep 1

## Originalzustand
# ...und stellen nun den originalen Zustand der xmodmap wieder her. Nedit läuft derweil unbeirrt weiter.
xmodmap $ORIG
