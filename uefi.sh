
 cd src
 cp config/console-efi.h config/console.h 
 cp config/general-efi.h config/general.h 
 cp config/branding-efi.h config/branding.h 
 make clean
make -j8 bin-x86_64-efi/ipxe.efi
make -j8 bin-x86_64-efi/snponly.efi
make -j8 bin-x86_64-efi/ipxe.efidrv
make -j8 bin-x86_64-linux/tap.linux
make -j8 bin-x86_64-linux/tests.linux
make -j8 bin-x86_64-efi/ipxe.efirom  
