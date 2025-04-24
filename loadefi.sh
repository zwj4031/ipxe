 cd src
 cp config/console-efi.h config/console.h 
 cp config/general-efi.h config/general.h 
 cp config/branding-loadefi.h config/branding.h 
 make bin-x86_64-efi/ipxe.efi EMBED=ipxeloadefi
 make bin-x86_64-efi/snponly.efi EMBED=ipxeloadefi
 
   


