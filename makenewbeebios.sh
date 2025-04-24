 cd src
 cp config/console-bios.h config/console.h 
 cp config/general-bios.h config/general.h 
 make bin/undionly.pxe EMBED=cloudnewbee.ipxe
 make bin/undionly.kpxe EMBED=cloudnewbee.ipxe
 make bin/undionly.kkpxe EMBED=cloudnewbee.ipxe
 make bin/undionly.kkkpxe EMBED=cloudnewbee.ipxe
 make bin/ipxe.pxe EMBED=cloudnewbee.ipxe
 make bin/ipxe.lkrn EMBED=cloudnewbee.ipxe
 make bin/ipxe.usb EMBED=cloudnewbee.ipxe
 make bin/ipxe.dsk EMBED=cloudnewbee.ipxe
 make bin/ipxe.iso EMBED=cloudnewbee.ipxe

   
   


