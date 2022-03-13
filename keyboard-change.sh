#!/bin/bash
set -eu

# https://wiki.archlinux.org/title/Xorg/Keyboard_configuration
# bt-abnt2

KEYBOARD=${KEYBOARD:-us}
MODEL=pc105
LAYOUT=us
VARIANT=intl
OPTS=""

# set us keyboard
if [ "$KEYBOARD" == "thinkpad" ] ; then
  # thinkpad E14
  MODEL=thinkpad60
  LAYOUT=br
  VARIANT=""
fi

# to force on X11 config
# localectl set-x11-keymap --no-convert $LAYOUT $MODEL $VARIANT $OPTS

# set on session current keyboard
echo "setxkbmap -model $MODEL -layout $LAYOUT -variant $VARIANT -option $OPTS"

# Cedilla
echo "==== having Cedilla problems? Have a look on this files:"
find /usr/lib -name immodules.cache
echo /usr/share/X11/locale/en_US.UTF-8/Compose
echo "sed 's/ć/ç/g' < /usr/share/X11/locale/en_US.UTF-8/Compose | sed 's/Ć/Ç/g' > Compose
sudo mv Compose /usr/share/X11/locale/en_US.UTF-8/Compose"


