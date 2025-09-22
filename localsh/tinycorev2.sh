#!/bin/sh
#
# 正确的 iPXE Legacy BIOS 编译脚本 (嵌入 tinycorev2.ipxe)
#

# 1. 从 GitHub Actions 提供的环境变量中获取构建信息
#    - GITHUB_SHA: 完整的 Git commit hash
#    - GITHUB_RUN_NUMBER: 工作流的运行编号
#    - :-0 是一个备用值，防止在本地测试时变量为空
SHORT_HASH=$(echo "${GITHUB_SHA}" | cut -c1-7)
BUILD_NUM=${GITHUB_RUN_NUMBER:-0}

# 2. 将所有自定义信息安全地组合到 VERSION_PATCH_EXTRA 字符串中
#    最终版本号会看起来像这样: 1.21.1-gH4sH-build123
VERSION_EXTRA="-g${SHORT_HASH}-build${BUILD_NUM}"

# 3. 使用【单次】make 命令，并用 EMBED 参数包含所有配置文件和脚本。
#    这会充分利用并行编译，速度极快。
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
     EMBED=tinycorev2.ipxe,config/console-bios.h,config/general-bios.h \
     VERSION_PATCH_EXTRA="${VERSION_EXTRA}"