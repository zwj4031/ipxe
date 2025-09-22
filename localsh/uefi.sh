#!/bin/sh
#
# 正确的 iPXE UEFI 及 Linux 测试编译脚本
#

# ==============================================================================
#  通用设置 (版本号)
# ==============================================================================

# 1. 从 GitHub Actions 提供的环境变量中获取构建信息
SHORT_HASH=$(echo "${GITHUB_SHA}" | cut -c1-7)
BUILD_NUM=${GITHUB_RUN_NUMBER:-0}

# 2. 将所有自定义信息安全地组合到 VERSION_PATCH_EXTRA 字符串中
VERSION_EXTRA="-g${SHORT_HASH}-build${BUILD_NUM}"


# ==============================================================================
#  步骤 1: 编译所有 UEFI 目标
# ==============================================================================

echo "--- Building all UEFI targets ---"
make -C src/ -j8 \
     bin-x86_64-efi/ipxe.efi \
     bin-x86_64-efi/snponly.efi \
     bin-x86_64-efi/ipxe.efidrv \
     bin-x86_64-efi/ipxe.efirom \
     EMBED=autoboot.ipxe,config/console-efi.h,config/general-efi.h,config/branding-efi.h \
     VERSION_PATCH_EXTRA="${VERSION_EXTRA}"


# ==============================================================================
#  步骤 2: 编译所有 Linux 测试目标
# ==============================================================================

echo "--- Building all Linux test targets ---"
# 注意：我们为 Linux 编译使用一个特殊的、禁用了所有平台功能的配置文件
make -C src/ -j8 \
     bin-x86_64-linux/tap.linux \
     bin-x86_64-linux/tests.linux \
     EMBED=config/console-efi.h,config/general-efi.h,config/branding-efi.h \
     VERSION_PATCH_EXTRA="${VERSION_EXTRA}"
cp -r src/bin-x86_64-efi/ipxe.efi /mnt/s/ipxefm/ipxe.efi	 