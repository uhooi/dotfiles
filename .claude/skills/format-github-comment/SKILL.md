---
name: format-github-comment
description: GitHub のコメントを所定の書式に整える。Issue や PR のコメント、レビュー指摘、返信などの下書きや整形に使う。
---

## フォーマット

```
{対応内容}
修正: {短縮SHA}

🤖 Generated with {AI 名}
```

- 対応内容は過不足なく説明する。文の数は問わない。1文で足りるなら1文、必要なら3文以上でもよい
- 対応内容の先頭に 🤖 を付けない。AI が書いたことは末尾の1行で分かる
- 短縮 SHA は先頭7桁。同じリポジトリなら SHA を貼るだけで GitHub がコミットの diff へのリンクにしてくれる
- 複数コミットにまたがる場合は「修正:」の行を並べる
- 修正を実装してコミットしたことを報告する場合だけ「修正:」の行を付ける。レビュー指摘や `LGTM` には付けない
- 末尾の1行は必ず入れる。AI が書いた返信だと分かるようにするため
- AI 名には、使った AI に応じて次の Markdown リンクを入れる
  - `[Claude Code](https://claude.com/claude-code)`
  - `[Codex](https://openai.com/codex/)`

## 例

```
`refreshable()` に置き換えました。
修正: a1b2c3d

🤖 Generated with [Claude Code](https://claude.com/claude-code)
```
