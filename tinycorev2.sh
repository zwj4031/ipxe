 cd src
 cp config/console-bios.h config/console.h 
 cp config/general-bios.h config/general.h 
 make bin/undionly.pxe EMBED=tinycorev2.ipxe
 make bin/undionly.kpxe EMBED=tinycorev2.ipxe
 make bin/undionly.kkpxe EMBED=tinycorev2.ipxe
 make bin/undionly.kkkpxe EMBED=tinycorev2.ipxe
 make bin/ipxe.pxe EMBED=tinycorev2.ipxe
 make bin/ipxe.lkrn EMBED=tinycorev2.ipxe
 make bin/ipxe.usb EMBED=tinycorev2.ipxe
 make bin/ipxe.dsk EMBED=tinycorev2.ipxe
 make bin/ipxe.iso EMBED=tinycorev2.ipxe

   
   


