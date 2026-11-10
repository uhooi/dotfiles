---
name: review
description: GitHub の PR をレビューする。`/review` が指定されたときや、PR の実装を確認してレビューコメントを書くよう頼まれたときに使う。
---

## レビューの進め方

1. 指定された URL や番号から PR を特定する。指定がなければ現在のブランチの PR を調べ、特定できなければ URL を聞く
2. `gh pr view` で PR の目的と先頭コミットの SHA を確認し、`gh pr diff` で差分を読む。必要に応じて変更箇所の周辺や呼び出し元も確認する
3. 変更に関係するリポジトリ内のドキュメント（`README.md`、`CONTRIBUTING.md`、`AGENTS.md`、設計資料など）を読み、仕様やルールに沿った実装か確認する

## レビュー観点

Google の `eng-practices` にある [レビューガイド](https://google.github.io/eng-practices/review/reviewer/) に原則として従います。設計やテストなどの確認項目は [What to look for in a code review](https://google.github.io/eng-practices/review/reviewer/looking-for.html) を参照します。リポジトリ固有のルールと、このスキルで定めるコメントの書式・投稿手順を優先します。

- チケットや PR に書かれた要件を満たしているか。目的と関係のない変更が混ざっていないか
- 対象の言語で一般的な実装から外れている場合、その理由は妥当か
- 既存の呼び出し元への影響を確認する。変更内容に応じて、公開 API や保存データの互換性、権限、性能も確認する

## 指摘コメント

文章は [`uhooi-writing`](../uhooi-writing/SKILL.md)、書式は [`format-github-comment`](../format-github-comment/SKILL.md) に従います。指摘ごとに、次のラベルから必ず1つだけ選び、本文の1行目に単独で置きます。

| ラベル | 使う場面 |
| --- | --- |
| `[q]` | 仕様や実装の意図について、判断に必要な情報を聞く |
| `[imo]` | 設計や実装について、採用は任意の改善案を出す |
| `[nits]` | 表記や命名など、採用は任意の細かい修正を提案する |
| `[must]` | マージ前に修正が必要な問題を、理由や影響とともに伝える |

修正が必須かを先に判断します。たとえば命名でも、単位を誤解して不具合につながるなら `[must]`、読みやすくするための提案なら `[nits]` です。

指摘はすべて、PR の差分上の該当行にインラインで投稿します。該当行に投稿できない指摘は、ファイル名と行番号を添えてチャットで伝えます。

## 投稿手順

ユーザーが `/review` を指定した場合や投稿を依頼した場合は、GitHub にコメントを投稿します。下書きの依頼にはチャットで返します。GitHub 上の操作はコメントの投稿に限ります。

- 投稿前に `gh pr view --json headRefOid` で確認した SHA と、レビューした SHA が一致することを確認する。変わっていれば新しい差分を読み、指摘と行番号を見直す
- 指摘がある場合は、次の方法でインラインコメントを投稿する。`line` は差分に表示されるファイルの行番号を指定する。追加行と差分に表示される未変更行は `RIGHT`、削除行は `LEFT` を使う。本文は `body_file` に保存する

```bash
gh api --hostname "$host" --method POST "repos/$owner/$repo/pulls/$pr/comments" \
  -F "body=@$body_file" -f "commit_id=$head_sha" -f "path=$path" \
  -F "line=$line" -f "side=$side" --jq '.html_url'
```

[GitHub のインラインコメント API](https://docs.github.com/en/rest/pulls/comments#create-a-review-comment-for-a-pull-request)

- レビューを終えて指摘が1件もない場合に限り、`LGTM` を [`format-github-comment`](../format-github-comment/SKILL.md) で整え、ラベルを付けずに PR 全体へ通常のコメントとして投稿する

```bash
gh pr comment "$pr" --repo "$host/$owner/$repo" --body-file "$body_file"
```
