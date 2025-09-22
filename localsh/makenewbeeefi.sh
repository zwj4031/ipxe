#!/bin/sh
#
# 正确的 iPXE 混合编译脚本 (同时编译 Legacy BIOS 和 UEFI)
#

# ==============================================================================
#  通用设置 (版本号)
# ==============================================================================

# 1. 从 GitHub Actions 提供的环境变量中获取构建信息
#    - GITHUB_SHA: 完整的 Git commit hash
#    - GITHUB_RUN_NUMBER: 工作流的运行编号
#    - :-0 是一个备用值，防止在本地测试时变量为空
SHORT_HASH=$(echo "${GITHUB_SHA}" | cut -c1-7)
BUILD_NUM=${GITHUB_RUN_NUMBER:-0}

# 2. 将所有自定义信息安全地组合到 VERSION_PATCH_EXTRA 字符串中
#    最终版本号会看起来像这样: 1.21.1-gH4sH-build123
VERSION_EXTRA="-g${SHORT_HASH}-build${BUILD_NUM}"


# ==============================================================================
#  步骤 1: 编译所有 Legacy BIOS 目标
# ==============================================================================

echo "--- Building all Legacy BIOS targets ---"
make -C src/ -j8 \
     bin/undionly.pxe \
     bin/undionly.kpxe \
     bin/undionly.kkpxe \
     bin/undionly.kkkpxe \
     bin/ipxe.pxe \
     bin/ipxe.lkrn \
     bin/ipxe.usb \
     bin/ipxe.dsk \
     bin/ipxe.iso \
     EMBED=cloudnewbee.ipxe,config/console-bios.h,config/general-bios.h \
     VERSION_PATCH_EXTRA="${VERSION_EXTRA}"


# ==============================================================================
#  步骤 2: 编译所有 UEFI 目标
# ==============================================================================

echo "--- Building all UEFI targets ---"
make -C src/ -j8 \
     bin-x86_64-efi/ipxe.efi \
     bin-x86_64-efi/snponly.efi \
     EMBED=cloudnewbee.ipxe,config/console-efi.h,config/general-efi.h \
     VERSION_PATCH_EXTRA="${VERSION_EXTRA}"