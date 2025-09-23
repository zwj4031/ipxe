#!/bin/sh
#
# iPXE UEFI 及 Linux 测试编译脚本 (通过替换配置文件实现)
#
set -e # 如果任何命令失败，立即退出脚本

# --- 1. 从环境变量获取构建信息 ---
cd ..
SHORT_HASH=$(echo "${GITHUB_SHA}" | cut -c1-7)
BUILD_NUM=${GITHUB_RUN_NUMBER:-0}
VERSION_EXTRA="-g${SHORT_HASH}-build${BUILD_NUM}"

# --- 2. 定义相关目录 ---
SRC_DIR="src"
CONFIG_DIR="$SRC_DIR/config"
# 根据您原脚本中的 CONFIG=chobit/efi 推断出自定义配置目录
LOCAL_CONFIG_DIR="$SRC_DIR/config/local/chobit/efi"
# 创建一个唯一的临时目录用于备份
BACKUP_DIR="/tmp/ipxe_efi_config_backup_$$"


# --- 3. 定义清理函数，用于编译后还原文件 ---
#    使用 trap 命令确保此函数在脚本退出时（无论成功或失败）都会被调用
cleanup() {
  if [ -d "$BACKUP_DIR" ]; then
    echo "--- 正在还原原始配置文件... ---"
    
    # 删除我们之前复制过来的自定义配置文件
    for file in "$LOCAL_CONFIG_DIR"/*.h; do
      filename=$(basename "$file")
      if [ -f "$CONFIG_DIR/$filename" ]; then
        rm -f "$CONFIG_DIR/$filename"
      fi
    done

    # 如果备份目录不为空，则将备份文件移回原位
    if [ "$(ls -A $BACKUP_DIR)" ]; then
       mv "$BACKUP_DIR"/*.h "$CONFIG_DIR/"
    fi
    
    # 删除空的备份目录
    rmdir "$BACKUP_DIR"
    echo "--- 清理完成 ---"
  fi
}
trap cleanup EXIT


# --- 4. 编译前准备 ---
echo "--- 开始 iPXE 构建流程 ---"

# 4.1. 备份原始配置文件
echo "--- 正在备份原始配置文件... ---"
mkdir -p "$BACKUP_DIR"
# 遍历本地配置目录下的所有.h文件
for file in "$LOCAL_CONFIG_DIR"/*.h; do
  filename=$(basename "$file")
  # 如果在主配置目录中存在同名文件，则将其移动到备份目录
  if [ -f "$CONFIG_DIR/$filename" ]; then
    echo "备份: $filename"
    mv "$CONFIG_DIR/$filename" "$BACKUP_DIR/"
  fi
done

# 4.2. 复制自定义配置文件
echo "--- 正在应用自定义配置文件... ---"
cp "$LOCAL_CONFIG_DIR"/*.h "$CONFIG_DIR/"


# ==============================================================================
#  步骤 5: 编译所有 UEFI 目标
# ==============================================================================

echo "--- 正在编译 UEFI 目标... ---"
# 注意：已移除 CONFIG=... 参数
make -C src/ -j8 \
     bin-x86_64-efi/ipxe.efi \
     bin-x86_64-efi/snponly.efi \
     bin-x86_64-efi/ipxe.efidrv \
     bin-x86_64-efi/ipxe.efirom \
     EMBED=config/local/chobit/ipxe/autoboot.ipxe \
     VERSION_PATCH_EXTRA="${VERSION_EXTRA}"


# ==============================================================================
#  步骤 6: 编译所有 Linux 测试目标
# ==============================================================================

echo "--- 正在编译 Linux 测试目标... ---"
# 注意：已移除 CONFIG=... 参数
make -C src/ -j8 \
     bin-x86_64-linux/tap.linux \
     bin-x86_64-linux/tests.linux \
     EMBED=config/local/chobit/ipxe/autoboot.ipxe \
     VERSION_PATCH_EXTRA="${VERSION_EXTRA}"

echo "--- 编译成功 ---"

# ==============================================================================
#  步骤 7: 复制最终产物
# ==============================================================================
cp -r src/bin-x86_64-efi/ipxe.efi /mnt/s/ipxefm/ipxe.efi

# 脚本执行完毕后，trap 会自动调用 cleanup 函数来还原文件```

### 主要改动说明
