 cd src
 cp config/console-bios.h config/console.h 
 cp config/general-bios.h config/general.h 
 make bin/undionly.pxe EMBED=ipxeboot.ipxe
 make bin/undionly.kpxe EMBED=ipxeboot.ipxe
 make bin/undionly.kkpxe EMBED=ipxeboot.ipxe
 make bin/undionly.kkkpxe EMBED=ipxeboot.ipxe
 make bin/ipxe.pxe EMBED=ipxeboot.ipxe
 make bin/ipxe.lkrn EMBED=ipxeboot.ipxe
 make bin/ipxe.usb EMBED=ipxeboot.ipxe
 make bin/ipxe.dsk EMBED=ipxeboot.ipxe
 make bin/ipxe.iso EMBED=ipxeboot.ipxe

   
   


