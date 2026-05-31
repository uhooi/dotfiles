---
name: commit
description: Gitでコミットするときに使う
---

Gitでコミットします。

## ステージング

- `git add -A` でまとめて追加しない。コミット対象のファイルを明示して `git add {ファイル}` する
- ステージング後は `git status` で意図しないファイル（`.serena/` など）が混ざっていないか確認する

## フォーマット

- Conventional Commitsに従う
  - 参考: https://www.conventionalcommits.org/ja/v1.0.0/
- 日本語で書く
- 作者に指示した人、共同の作者にAIを指定する

## コミット後

- 対象ブランチをプッシュする
