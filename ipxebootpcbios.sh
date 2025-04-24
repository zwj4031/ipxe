 cd src
 cp config/console-bios.h config/console.h 
 cp config/general-bios.h config/general.h 
 make -j8 bin/undionly.pxe EMBED=ipxeboot.ipxe
 make -j8 bin/undionly.kpxe EMBED=ipxeboot.ipxe
 make -j8 bin/undionly.kkpxe EMBED=ipxeboot.ipxe
 make -j8 bin/undionly.kkkpxe EMBED=ipxeboot.ipxe
 make -j8 bin/ipxe.pxe EMBED=ipxeboot.ipxe
 make -j8 bin/ipxe.lkrn EMBED=ipxeboot.ipxe
 make -j8 bin/ipxe.usb EMBED=ipxeboot.ipxe
 make -j8 bin/ipxe.dsk EMBED=ipxeboot.ipxe
 make -j8 bin/ipxe.iso EMBED=ipxeboot.ipxe

   
   


