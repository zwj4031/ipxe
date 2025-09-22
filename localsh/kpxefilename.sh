#!/bin/sh
#
# 正确的 iPXE undionly 编译脚本
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

# 3. 使用【单次】make 命令一次性编译所有目标，并传入 EMBED 和版本号参数
make -C src/ \
     bin/undionly.pxe \
     bin/undionly.kpxe \
     bin/undionly.kkpxe \
     bin/undionly.kkkpxe \
     EMBED=filename.ipxe \
     VERSION_PATCH_EXTRA="${VERSION_EXTRA}"