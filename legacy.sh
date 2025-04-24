  
 cd src
 cp config/console-bios.h config/console.h 
 cp config/general-bios.h config/general.h 
 cp config/branding-bios.h config/branding.h 
 make clean
 make -j8 bin/undionly.pxe
 make -j8 bin/undionly.kpxe
 make -j8 bin/undionly.kkpxe
 make -j8 bin/undionly.kkkpxe
 make -j8 bin/ipxe.pxe
 make -j8 bin/ipxe.lkrn
 make -j8 bin/ipxe.usb
 make -j8 bin/ipxe.dsk
 make -j8 bin/ipxe.iso
