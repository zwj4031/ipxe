 cd src
 cp config/console-bios.h config/console.h 
 cp config/general-bios.h config/general.h 
 make bin/undionly.pxe EMBED=porteus.ipxe
 make bin/undionly.kpxe EMBED=porteus.ipxe
 make bin/undionly.kkpxe EMBED=porteus.ipxe
 make bin/undionly.kkkpxe EMBED=porteus.ipxe
 make bin/ipxe.pxe EMBED=porteus.ipxe
 make bin/ipxe.lkrn EMBED=porteus.ipxe
 make bin/ipxe.usb EMBED=porteus.ipxe
 make bin/ipxe.dsk EMBED=porteus.ipxe
 make bin/ipxe.iso EMBED=porteus.ipxe

   
   


