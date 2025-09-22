#!/bin/sh
#
# 正确的 iPXE 混合编译脚本 (UEFI 和 BIOS)
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

echo "--- Building UEFI targets ---"
make -C src/ -j8 \
     bin-x86_64-efi/ipxe.efi \
     bin-x86_64-efi/snponly.efi \
     EMBED=custom.ipxe,config/console-efi.h,config/general-efi.h \
     VERSION_PATCH_EXTRA="${VERSION_EXTRA}"


# ==============================================================================
#  步骤 2: 编译所有 Legacy BIOS 目标
# ==============================================================================

echo "--- Building Legacy BIOS targets ---"
make -C src/ -j8 \
     bin/ipxe.iso \
     EMBED=cloudnewbee.ipxe,config/console-bios.h,config/general-bios.h \
     VERSION_PATCH_EXTRA="${VERSION_EXTRA}"