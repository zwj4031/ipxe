
copy src\bin\undionly.pxe out\tinycore.pxe.0 /y
copy src\bin\undionly.kpxe out\tinycore.kpxe.0 /y
copy src\bin\undionly.kkpxe out\tinycore.kkpxe.0 /y
copy src\bin\undionly.kkkpxe out\tinycore.kkkpxe.0 /y
copy src\bin-x86_64-efi\ipxe.efi  out\loadefi.efi.0
copy src\bin-x86_64-efi\snponly.efi  out\snponly.efi.0

exit


copy src\bin\undionly.pxe F:\pxeboot\undionly.pxe.0 /y
copy src\bin\undionly.kpxe F:\pxeboot\undionly.kpxe.0 /y
copy src\bin\undionly.kkpxe F:\pxeboot\undionly.kkpxe.0 /y
copy src\bin\undionly.kkkpxe F:\pxeboot\undionly.kkkpxe.0 /y

copy out\*.0 D:\pxeboot\2019linuxserver\tftpboot /y
pause