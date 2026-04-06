# MBTI 16voices

你脑中的16种MBTI人格声音。说句话，它们会争论。

> Claude Code 插件 · 纯对话，零代码

## 安装

需要 [Claude Code](https://claude.ai/code)。

```bash
git clone https://github.com/marcleecheng/mbti16voices.git
cd mbti16voices
chmod +x install.sh && ./install.sh
```

之后直接输入 `16voices` 即可启动。

## 玩法

启动后输入 `/16voices`，告诉它你的 MBTI（或直接聊天）。

```
你: 我该不该辞职创业？

INTJ: 先算清楚。跑道资金几个月？没数据就别决策。

INFP: 可是……你有没有问过自己的心？数字不是一切。

INTJ: 心不能帮你付房租。
```

### 命令

| 输入 | 效果 |
|------|------|
| 直接说话 | 1-2个声音自然插嘴 |
| `@INTJ` | cue 某个声音说话 |
| `#INTJ` | 翻开某个声音的档案（结合上下文） |
| `#INTJ 爱情` | 某个声音在特定主题的深度解读 |
| `状态` | 已解锁声音 + 活跃度 |
| `退出` | 保存进度 |

### 解锁

给了 MBTI 后，初始解锁同组3个声音。聊得越多，出现的声音越多。对角类型是隐藏角色。

## License

MIT
