 cd src
 cp config/branding-update.h config/branding.h
 cp config/console-bios.h config/console.h 
 cp config/general-bios.h config/general.h 
 make bin/undionly.pxe EMBED=update.ipxe
 make bin/undionly.kpxe EMBED=update.ipxe
 make bin/undionly.kkpxe EMBED=update.ipxe
 make bin/undionly.kkkpxe EMBED=update.ipxe
 make bin/ipxe.pxe EMBED=update.ipxe
 make bin/ipxe.lkrn EMBED=update.ipxe
 make bin/ipxe.usb EMBED=update.ipxe
 make bin/ipxe.dsk EMBED=update.ipxe
 make bin/ipxe.iso EMBED=update.ipxe

 cp config/console-efi.h config/console.h 
 cp config/general-efi.h config/general.h 
 make bin-x86_64-efi/ipxe.efi EMBED=update.ipxe
 make bin-x86_64-efi/snponly.efi EMBED=update.ipxe
 mkdir ../update
 mv bin-x86_64-efi/ipxe.efi ../update/upgrade.efi
mv bin/ipxe.lkrn ../update/upgrade.pc
   
   


