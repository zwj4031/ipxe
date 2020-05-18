 cd src
 cp config/console-bios.h config/console.h 
 cp config/general-bios.h config/general.h 
 cp config/console-efi.h config/console.h 
 cp config/general-efi.h config/general.h 
 make bin-x86_64-efi/ipxe.efi EMBED=porteus.ipxe
 make bin-x86_64-efi/snponly.efi EMBED=porteus.ipxe

   
   


