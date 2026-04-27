#!/system/bin/sh

wait_for_key() {
  while true; do
    KEY=$(getevent -lc 1 2>/dev/null | awk '{ print $3 }' | grep 'KEY_' | head -1)
    case "$KEY" in
      KEY_VOLUMEUP)   return 0 ;;
      KEY_VOLUMEDOWN) return 1 ;;
    esac
  done
}

ui_print " "
ui_print "                                        "
ui_print "  ██████╗  █████╗                       "
ui_print "  ██╔══██╗██╔══██╗                      "
ui_print "  ██████╔╝███████║                      "
ui_print "  ██╔══██╗██╔══██║                      "
ui_print "  ██║  ██║██║  ██║                      "
ui_print "  ╚═╝  ╚═╝╚═╝  ╚═╝                      "
ui_print "                                        "
ui_print " "
ui_print "    Eye-of-RA  "
ui_print "  Custom Boot Animation Module"
ui_print "  by Abhranil-Dasgupta"
ui_print " "
ui_print "============================================"
ui_print "  Device  : Any Device "
ui_print "  ROM     : Any (Android 12+)"
ui_print "  Root    : KernelSU only"
ui_print "  Version : v1.0.0"
ui_print "============================================"
ui_print " "
ui_print "   WARNING "
ui_print " "
ui_print "  This module replaces your boot animation."
ui_print "  meta-overlayfs MUST be installed first."
ui_print " "
ui_print "  Your original bootanimation.zip is NOT"
ui_print "  backed up automatically. Do it manually"
ui_print "  from system/product/media/ before installing."
ui_print " "
ui_print "  To uninstall: disable/remove this module"
ui_print "  in KernelSU Manager, then reboot."
ui_print " "
ui_print "============================================"
ui_print " "
ui_print "  >> Vol UP        =  Install  (YES)"
ui_print "  >> Vol DOWN      =  Cancel   (NO)"
ui_print " "

wait_for_key
CHOICE=$?

if [ "$CHOICE" = "0" ]; then
  ui_print "   Initializing Eye-of-RA for Your Device..."
  ui_print " "
  ui_print "  Done! Reboot to see your animation."
  ui_print "============================================"
else
  ui_print "   Installation cancelled by user."
  ui_print "============================================"
  abort "Aborted."
fi