# Qiita の Markdown 記法

SKILL.md でよく使う記法は説明済みです。ここには、必要になったときに引く記法をまとめます。

:::note warn
**これは 2026-08-01 時点の写しです。**

出典の記事は Qiita 公式が随時更新するため、内容が古くなっている可能性があります。
次のときは、ここを信じずに出典を取得してください。

- 使いたい記法がここに載っていない
- 書いた記法が Qiita のプレビューで期待通りに表示されない
- 記法の細かい仕様（対応言語、制限値など）を確認したい

出典: https://qiita.com/Qiita/items/c686397e4a0f4f11683d
:::

## 目次

- [note 記法](#note-記法)
- [コードブロック](#コードブロック)
- [折りたたみ](#折りたたみ)
- [リンクカード](#リンクカード)
- [表](#表)
- [チェックボックス](#チェックボックス)
- [脚注](#脚注)
- [絵文字](#絵文字)
- [数式](#数式)
- [図（Mermaid / PlantUML）](#図mermaid--plantuml)
- [目次](#目次-1)
- [その他](#その他)

## note 記法

3 段階の強さで補足を出せます。

```markdown
:::note info
補足や豆知識
:::

:::note warn
気をつけてほしいこと
:::

:::note alert
やると壊れること
:::
```

`:::note` のみだと `info` と同じ見た目になります。
note の中では、箇条書き・強調・インラインコード・リンク・画像・コードブロックが使えます。

## コードブロック

言語とファイル名を指定できます。

````markdown
```ruby:qiita.rb
puts 'code'
```
````

差分表示は `diff_{言語}` です。行頭に `+` `-` を付けます。

````markdown
```diff_ruby:qiita.rb
- puts 'old'
+ puts 'new'
```
````

よく使う言語指定:

| 用途 | 指定 |
|:--|:--|
| シェルの実行例（プロンプトと出力込み） | `shell-session` |
| シェルスクリプト | `bash` / `sh` |
| 設定ファイルの差分 | `diff_bash` / `diff_yaml` など |
| Swift | `swift` |
| JSON / YAML / TOML | `json` / `yaml` / `toml` |
| プレーンテキスト | `text` |

コードブロックを含むコードブロックを書くときは、外側をバッククォート 4 つで囲みます。

## 折りたたみ

HTML の `details` を使います。`summary` の次に**空行が必要**です。空行がないと中身が Markdown として解釈されません。

```markdown
<details><summary>長い実行ログ</summary>

```shell-session
$ command
...
```

</details>
```

## リンクカード

URL を単独行に置き、**前後に空行**を入れるとカードになります。

```markdown
本文です。

https://github.com/abiosoft/colima

続きの本文です。
```

箇条書きの中の URL や、行の途中の URL はカードになりません。

## 表

```markdown
|コマンド|説明|備考|
|:--|:--|:--|
|`pnpm install`|依存関係をインストールする|`npm install` と同等|
```

- `:--` 左寄せ / `:-:` 中央寄せ / `--:` 右寄せ
- セル内で `|` を使うときは `\|` とエスケープする
- セル内で改行したいときは `<br>` を使う

## チェックボックス

```markdown
- [ ] 未完了
- [x] 完了
```

## 脚注

```markdown
本文です[^1]。

[^1]: 脚注の内容
```

## 絵文字

GitHub と同じ記法です。

```markdown
:relaxed: :smile: :bow: :tada: :warning:
```

## 数式

ブロック:

````markdown
```math
\left( \sum_{k=1}^n a_k b_k \right)^2
```
````

インライン:

```markdown
$`x^2 + y^2 = 1`$
```

## 図（Mermaid / PlantUML）

````markdown
```mermaid
graph TD;
  A-->B;
```
````

Mermaid には制限があります。

- 2000 文字以下
- Chain 数 10 以下
- Interaction 機能は無効

PlantUML も使えます。

````markdown
```plantuml
Bob->Alice : Hello!
```
````

## 目次

見出しから自動生成され、記事の右側に表示されます。自分で書く必要はありません。

## その他

- **引用**: 行頭に `> `
- **水平線**: `---`（前後に空行）
- **画像**: `![代替テキスト](URL)`。Qiita にドラッグ&ドロップでアップロードできる
- **HTML**: 一部のタグが使える。`details` `br` `kbd` `sup` `sub` など
