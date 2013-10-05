#!/bin/bash

. /etc/vbox/vbox.cfg
. /etc/conf.d/vboxdrv

if [ "$EUID" -ne "0" ]; then
  echo "Please run this script with root privileges"
  exit 0
fi

if [[ -n "$INSTALL_DIR" ]]; then
  MODULE_SRC="$INSTALL_DIR/src/vboxhost"
else
  echo "Missing /etc/vbox/vbox.cfg"
  exit 0
fi
BUILDINTMP="$MODULE_SRC/build_in_tmp"
DODKMS="$MODULE_SRC/do_dkms"

# detection of dkms (if not disabled)
if [[ "$DISABLE_DKMS" =~ [yY][eE][sS] ]]; then
  USE_DKMS=0
else
  which dkms &>/dev/null
  USE_DKMS=$((! $?))
fi

# STARTBUILD cannot be used with dkms
(( USE_DKMS == 1 )) && START_BUILD=no


load() {
  if [[ "$START_BUILD" =~ [yY][eE][sS] ]]; then
    # check if module exists
    c=$('find' "/lib/modules/$(uname -r)" -type f -regex '.*/vbox\(drv\|netadp\|netflt\|pci\).ko' | wc -l)
    ((c == 0 )) && setup
  fi
  echo "Loading VirtualBox kernel modules"
  # trivial loading
  for module in vbox{drv,netadp,netflt,pci}; do
      modprobe $module &>/dev/null
  done
  # check
  for module in vbox{drv,netadp,netflt,pci}; do
    if ! grep -q "^${module}" /proc/modules; then
      echo "Module ${module} could not be loaded"
      return 1
    fi
  done
}

unload() {
  echo "Unloading VirtualBox kernel modules"
  # trivial unload
  for module in vbox{pci,netflt,netadp,drv}; do
    if grep -q "^${module}" /proc/modules; then
      modprobe -r $module &>/dev/null
    fi
  done
  # check
  for module in vbox{pci,drv,netadp,netflt}; do
    if grep -q "^${module}" /proc/modules; then
      echo "Module ${module} could not be unloaded"
      return 1
    fi
  done
}

remove() {
  unload
  if (( USE_DKMS == 1 )); then
    echo "Removing VirtualBox kernel modules with DKMS"
    $DODKMS uninstall vboxhost vboxdrv vboxnetflt vboxnetadp > $LOG
  else
    echo "Removing VirtualBox kernel modules"
    find "/lib/modules/$(uname -r)" -type f -regex '.*/vbox\(pci\|drv\|netadp\|netflt\).ko' -delete
  fi
}

setup() {
  if (( USE_DKMS == 1 )); then
    echo "Trying to register the VirtualBox kernel modules using DKMS"
    $DODKMS install vboxhost "$INSTALL_VER" >> $LOG
  else
    remove
    echo "Compiling VirtualBox kernel modules"
    LOG="/tmp/vbox-install.log"
    if ! $BUILDINTMP \
      --save-module-symvers /tmp/vboxdrv-Module.symvers \
	  --module-source "$MODULE_SRC/vboxdrv" \
      --no-print-directory install > $LOG 2>&1; then
      echo  "Look at $LOG to find out what went wrong"
      return 1
    fi
    if ! $BUILDINTMP \
      --use-module-symvers /tmp/vboxdrv-Module.symvers \
	  --module-source "$MODULE_SRC/vboxnetflt" \
      --no-print-directory install >> $LOG 2>&1; then
      echo "Look at $LOG to find out what went wrong"
      return 1
    fi
    if ! $BUILDINTMP \
      --use-module-symvers /tmp/vboxdrv-Module.symvers \
	  --module-source "$MODULE_SRC/vboxnetadp" \
      --no-print-directory install >> $LOG 2>&1; then
      echo "Look at $LOG to find out what went wrong"
      return 1
    fi
	if ! $BUILDINTMP \
      --use-module-symvers /tmp/vboxdrv-Module.symvers \
      --module-source "$MODULE_SRC/vboxpci" \
      --no-print-directory install >> $LOG 2>&1; then
      echo "Look at $LOG to find out what went wrong"
      return 1
    fi
    depmod -A
  fi
  echo -e "\n==> Make sure to load the required modules to use VirtualBox"
}

fixusb() {
  # Build our device tree
  for i in /sys/bus/usb/devices/*; do
    if test -r "$i/dev"; then
      dev="`cat "$i/dev" 2> /dev/null`"
      major="`expr "$dev" : '\(.*\):' 2> /dev/null`"
      minor="`expr "$dev" : '.*:\(.*\)' 2> /dev/null`"
      class="`cat $i/bDeviceClass 2> /dev/null`"
      sh "$INSTALL_DIR/VBoxCreateUSBNode.sh" "$major" "$minor" "$class" 2>/dev/null
    fi
  done
}

case "$1" in
  setup)
    setup
    load
    ;;
  fixusb)
    fixusb
    ;;
  remove)
    remove
    ;;
  *)
  echo "usage: $0 {setup|fixusb}"
esac
