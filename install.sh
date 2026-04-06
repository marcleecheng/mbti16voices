#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR"

echo ""
echo "  MBTI16voices"
echo "  ──────────────────────"
echo ""

# 检查 claude 命令
if ! command -v claude &> /dev/null; then
    echo "  ✘ 需要先安装 Claude Code: https://claude.ai/code"
    exit 1
fi
echo "  ✓ Claude Code 已就绪"

# 创建全局命令
LAUNCHER="$SCRIPT_DIR/bin/16voices"
mkdir -p "$SCRIPT_DIR/bin"
cat > "$LAUNCHER" << EOF
#!/bin/bash
cd "$SCRIPT_DIR"
exec claude --plugin-dir .
EOF
chmod +x "$LAUNCHER"

LINK_TARGET=""
LINKED=false
if [ -d "$HOME/.local/bin" ] || mkdir -p "$HOME/.local/bin" 2>/dev/null; then
    LINK_TARGET="$HOME/.local/bin/16voices"
elif [ -d "/usr/local/bin" ] && [ -w "/usr/local/bin" ]; then
    LINK_TARGET="/usr/local/bin/16voices"
fi

if [ -n "$LINK_TARGET" ]; then
    if ln -sf "$LAUNCHER" "$LINK_TARGET" 2>/dev/null; then
        LINKED=true
        LINK_DIR="$(dirname "$LINK_TARGET")"
        if ! echo "$PATH" | tr ':' '\n' | grep -qx "$LINK_DIR"; then
            SHELL_RC="$HOME/.zshrc"
            [ -n "$BASH_VERSION" ] && SHELL_RC="$HOME/.bashrc"
            if ! grep -q "$LINK_DIR" "$SHELL_RC" 2>/dev/null; then
                echo "export PATH=\"$LINK_DIR:\$PATH\"" >> "$SHELL_RC"
            fi
            export PATH="$LINK_DIR:$PATH"
        fi
        echo "  ✓ 全局命令已创建：16voices"
    fi
fi

# 创建 state 目录
mkdir -p "$SCRIPT_DIR/state"
echo "  ✓ 安装完成"

echo ""
echo "  正在启动 16voices..."
echo ""
if [ "$LINKED" = true ]; then
    echo "  💡 下次启动只需输入：16voices"
else
    echo "  💡 下次启动请运行："
    echo "  cd $SCRIPT_DIR && claude --plugin-dir ."
fi
echo ""

cd "$SCRIPT_DIR"
exec claude --plugin-dir .
