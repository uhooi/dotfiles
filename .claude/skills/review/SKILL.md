---
name: review
description: GitHub の PR をレビューする。`/review` が指定されたときや、PR の実装を確認してレビューコメントを書くよう頼まれたときに使う。指摘への対応を確認する再レビューにも使う。
---

## レビューの進め方

1. 指定された URL や番号から PR を特定する。指定がなければ現在のブランチの PR を調べ、特定できなければ URL を聞く
2. 「投稿ユーザー」に従って、GitHub の操作に使うユーザーを決める
3. `gh pr view` で PR の目的と先頭コミットの SHA を確認し、`gh pr diff` で差分を読む。必要に応じて変更箇所の周辺や呼び出し元も確認する
4. 変更に関係するリポジトリ内のドキュメント（`README.md`、`CONTRIBUTING.md`、`AGENTS.md`、設計資料など）を読み、仕様やルールに沿った実装か確認する

## 投稿ユーザー

投稿する GitHub のユーザー名が指定された場合は、そのユーザーでコメントを投稿します。指定がなければ、今まで通り `gh` のデフォルトの認証を使います。

ユーザー名が指定された場合は、対象 PR のホストを `host`、指定されたユーザー名を `review_user` に設定し、保存済みのトークンを取得します。

```bash
review_token=$(gh auth token --hostname "$host" --user "$review_user")
```

トークンを取得できない場合は、指定ユーザーでの認証が必要なことを伝え、投稿を止めます。別のユーザーでは投稿しません。トークンは画面やログ、ファイルに出力しません。

以降の `gh` コマンドには、次のようにコマンド単位で認証情報を渡します。まずログイン名を確認し、指定ユーザーと一致しなければ投稿を止めます。

```bash
GH_TOKEN="$review_token" GH_ENTERPRISE_TOKEN="$review_token" \
  gh api --hostname "$host" user --jq '.login'
```

このスキル内のすべての `gh` コマンドに同じ認証情報を渡します。インラインコメント、`LGTM`、再レビューの返信、スレッドの resolve にも適用します。`gh auth switch` や環境変数の `export` は使わず、デフォルトの認証設定を変えません。

[トークンの取得](https://cli.github.com/manual/gh_auth_token)、[認証用の環境変数](https://cli.github.com/manual/gh_help_environment)

## レビュー観点

Google の `eng-practices` にある [レビューガイド](https://google.github.io/eng-practices/review/reviewer/) に原則として従います。設計やテストなどの確認項目は [What to look for in a code review](https://google.github.io/eng-practices/review/reviewer/looking-for.html) を参照します。リポジトリ固有のルールと、このスキルで定めるコメントの書式・投稿手順を優先します。

- チケットや PR に書かれた要件を満たしているか。目的と関係のない変更が混ざっていないか
- 対象の言語で一般的な実装から外れている場合、その理由は妥当か
- 既存の呼び出し元への影響を確認する。変更内容に応じて、公開 API や保存データの互換性、権限、性能も確認する

## 指摘コメント

文章は [`uhooi-writing`](../uhooi-writing/SKILL.md)、書式は [`format-github-comment`](../format-github-comment/SKILL.md) に従います。指摘ごとに、次のラベルから必ず1つだけ選び、本文の1行目に単独で置きます。ラベルと本文の間に空白行は不要です。

| ラベル | 使う場面 |
| --- | --- |
| `[q]` | 仕様や実装の意図について、判断に必要な情報を聞く |
| `[imo]` | 設計や実装について、採用は任意の改善案を出す |
| `[nits]` | 表記や命名など、採用は任意の細かい修正を提案する |
| `[must]` | マージ前に修正が必要な問題を、理由や影響とともに伝える |

修正が必須かを先に判断します。たとえば命名でも、単位を誤解して不具合につながるなら `[must]`、読みやすくするための提案なら `[nits]` です。

指摘はすべて、PR の差分上の該当行にインラインで投稿します。該当行に投稿できない指摘は、ファイル名と行番号を添えてチャットで伝えます。

## 投稿手順

ユーザーが `/review` を指定した場合や投稿を依頼した場合は、GitHub にコメントを投稿します。下書きの依頼にはチャットで返します。GitHub 上の操作は、コメントの投稿と、再レビューでのスレッドの resolve に限ります。

- 投稿前に `gh pr view --json headRefOid` で確認した SHA と、レビューした SHA が一致することを確認する。変わっていれば新しい差分を読み、指摘と行番号を見直す
- 指摘がある場合は、次の方法でインラインコメントを投稿する。`line` は差分に表示されるファイルの行番号を指定する。追加行と差分に表示される未変更行は `RIGHT`、削除行は `LEFT` を使う。本文は `body_file` に保存する

```bash
gh api --hostname "$host" --method POST "repos/$owner/$repo/pulls/$pr/comments" \
  -F "body=@$body_file" -f "commit_id=$head_sha" -f "path=$path" \
  -F "line=$line" -f "side=$side" --jq '.html_url'
```

[GitHub のインラインコメント API](https://docs.github.com/en/rest/pulls/comments#create-a-review-comment-for-a-pull-request)

- レビューを終えて指摘が1件もない場合と、再レビューですべての指摘が解消した場合に限り、`LGTM` を [`format-github-comment`](../format-github-comment/SKILL.md) で整え、ラベルを付けずに PR 全体へ通常のコメントとして投稿する

```bash
gh pr comment "$pr" --repo "$host/$owner/$repo" --body-file "$body_file"
```

## 再レビュー

再レビューを頼まれたときや、対象の PR に自分が指摘した未解決のスレッドがあるときは、指摘への対応を確認します。

1. 未解決のスレッドを取得し、自分が始めたものだけを対象にする。自分のログイン名は「投稿ユーザー」で決めた認証を使い、`gh api --hostname "$host" user --jq '.login'` で調べる

```bash
gh api graphql --hostname "$host" -f query='
query($owner:String!, $repo:String!, $pr:Int!) {
  repository(owner:$owner, name:$repo) {
    pullRequest(number:$pr) {
      reviewThreads(first:100) {
        nodes {
          id
          isResolved
          path
          line
          comments(first:50) { nodes { databaseId author { login } body } }
        }
      }
    }
  }
}' -f owner="$owner" -f repo="$repo" -F pr="$pr"
```

2. スレッドごとに返信と修正内容を読み、指摘が解消したか確認する。返信も修正もないスレッドには何もしない
3. 結果をスレッドに返信する。書式は指摘コメントと同じだが、ラベルは付けない。`comment_id` にはスレッドの先頭のコメントの `databaseId` を指定する
   - 対応に問題がなければ、その旨を返信してスレッドを resolve する
   - 問題があれば、その旨を返信する。resolve はしない

```bash
gh api --hostname "$host" --method POST \
  "repos/$owner/$repo/pulls/$pr/comments/$comment_id/replies" \
  -F "body=@$body_file" --jq '.html_url'
```

```bash
gh api graphql --hostname "$host" -f query='
mutation($threadId:ID!) {
  resolveReviewThread(input:{threadId:$threadId}) { thread { isResolved } }
}' -f threadId="$thread_id"
```

4. 修正で新しい問題が見つかった場合は、通常の手順で新しい指摘として投稿する
5. 自分の指摘がすべて解消し、新しい指摘もなければ、投稿手順と同じ方法で `LGTM` を投稿する。未解決の指摘が1件でも残っていれば投稿しない
