#!/usr/bin/env sh
mkdir build
touch build/ventoy.dat

#xorriso -as mkisofs -R -hide-joliet boot.catalog -b fmldr -no-emul-boot -allow-lowercase -boot-load-size 4 -boot-info-table -o grubfm.iso build

dd if=/dev/zero of=build/efi.img bs=1KB count=1100
mkfs.vfat build/efi.img
mmd -i build/efi.img ::EFI
mmd -i build/efi.img ::EFI/BOOT
mcopy -i build/efi.img src/bin-x86_64-efi/ipxe.efi ::EFI/BOOT/BOOTX64.EFI
cp src/bin/ipxe.lkrn build
xorriso -as mkisofs -l -R -hide-joliet boot.catalog -b ISOLINUX.BIN -no-emul-boot -allow-lowercase -boot-load-size 4 -boot-info-table -eltorito-alt-boot -e efi.img -no-emul-boot -o CloudNewBeePE.iso build
rm -rf build/ipxe.lkrn
rm -rf build/efi.img
mkdir /mnt/s/ipxe
cp -r CloudNewBeePE.iso /mnt/s/ipxe

