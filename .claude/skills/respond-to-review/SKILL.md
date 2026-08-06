---
name: respond-to-review
description: PR のレビュー指摘に対応する。「レビュー指摘に対応してください」と言われたとき、レビューコメントの URL（#discussion_r… や #issuecomment… 付きの GitHub URL）が貼られたときに必ずこのスキルを使う。指摘ごとにコミットを分け、対応後にコメントへ返信するときにも使う。
---

PR のレビュー指摘に対応し、指摘元へ返信します。

## 進め方

1. 指摘を集める
2. 指摘をグルーピングする（同じ修正になるものだけまとめる）
3. グループごとに修正 → コミット → プッシュ
4. 指摘元のコメントに返信する

## 1. 指摘を集める

URL が貼られた場合は、その URL の指摘だけを対象にします。URL の末尾で種類が分かります。

| URL の末尾 | 種類 | 取得コマンド |
| --- | --- | --- |
| `#discussion_r{ID}` | コードへの行コメント | `gh api repos/{owner}/{repo}/pulls/comments/{ID}` |
| `#issuecomment-{ID}` | PR 全体へのコメント | `gh api repos/{owner}/{repo}/issues/comments/{ID}` |
| `#pullrequestreview-{ID}` | レビュー本体のコメント | `gh api repos/{owner}/{repo}/pulls/{PR番号}/reviews/{ID}` |

URL が貼られず「レビュー指摘に対応してください」と言われた場合は、現在のブランチの PR から未解決スレッドを集めます。

```bash
gh pr view --json number,headRepositoryOwner,headRepository
gh api graphql -f query='
query($owner:String!, $repo:String!, $pr:Int!) {
  repository(owner:$owner, name:$repo) {
    pullRequest(number:$pr) {
      reviewThreads(first:100) {
        nodes {
          isResolved
          isOutdated
          path
          line
          comments(first:20) { nodes { databaseId author { login } body } }
        }
      }
    }
  }
}' -F owner={owner} -F repo={repo} -F pr={PR番号}
```

- `isResolved: true` のスレッドは対象外
- スレッド内の最後のコメントの `databaseId` に返信する

## 2. グルーピング

- 1つの指摘 = 1コミットが基本
- 例外は修正が重複する場合だけ。同じファイルの同じ箇所を直すことになる指摘は、まとめて1コミットにする
- 「関連しているから」「まとめた方が楽だから」でまとめない

## 3. 修正とコミット

- グループごとに修正 → コミット → プッシュを繰り返す
- コミットは commit スキルに従う
- 返信でコミットの URL を貼るため、返信の前にプッシュを済ませる（プッシュ前の SHA はリンク先が 404 になる）
- 修正が不要だと判断した指摘はコミットしない。理由を返信するだけにする

## 4. 返信

指摘元のコメントに返信します。文章は uhooi-writing スキルに従います。

### フォーマット

```
{対応内容を1〜2文で}

修正: [`{短縮SHA}`](https://github.com/{owner}/{repo}/pull/{PR番号}/commits/{SHA})

> このコメントは {AI 名} が書きました
```

- 短縮 SHA は先頭7桁
- コミット URL は PR 配下（`/pull/{PR番号}/commits/{SHA}`）にする。PR の文脈で diff が開ける
- 複数コミットにまたがる場合は箇条書きで並べる
- コミットしていない場合は「修正:」の行を省く
- 末尾の1行は必ず入れる。AI が書いた返信だと分かるようにするため
- AI 名はモデル名まで書く（例: `Claude Code (Opus 5)`、`Codex`）

### 返信コマンド

コードへの行コメント（スレッドへの返信）:

```bash
gh api repos/{owner}/{repo}/pulls/{PR番号}/comments/{コメントID}/replies -f body="$(cat <<'EOF'
{本文}
EOF
)"
```

PR 全体へのコメント（引用して返信）:

```bash
gh pr comment {PR番号} --body "$(cat <<'EOF'
{本文}
EOF
)"
```

### 返信の書き方

- 直したことだけを書く。指摘内容の言い換えや復唱はしない
- 見送る場合は理由を書く。「別 PR でやります」ならその旨も書く
- 判断に迷った指摘は、そう書いてレビュアーに聞く

例:

```
`refreshable()` に置き換えました。

修正: [`a1b2c3d`](https://github.com/uhooi/foo/pull/12/commits/a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6e7f8a9b0)

> このコメントは Claude Code (Opus 5) が書きました
```

## やらないこと

- 指示がない限りスレッドを Resolve しない。解決の判断はレビュアーに任せる
- 指摘されていない箇所を「ついでに」直さない
