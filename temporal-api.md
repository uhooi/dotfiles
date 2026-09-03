---
title: JavaScriptのTemporal APIの使い方(Dateからの移行)
tags:
  - temporal
  - JavaScript
  - TypeScript
  - ECMAScript
private: false
updated_at: ''
id: null
organization_url_name: null
slide: false
ignorePublish: false
---
:::note info
本記事の執筆にはAIを使用しています。
:::

## はじめに

JavaScriptの新しい日時APIである `Temporal` を紹介します。
既存の `Date` と比べたメリット・デメリットや、TypeScriptでの移行例をまとめます。

## 「Temporal」とは？

日時を用途ごとの型で扱うJavaScriptの標準APIです。

https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal

`Date` を置き換えるために作られ、TC39のStage 4へ到達しています。
日時の計算やタイムゾーン、暦を標準で扱えます。

## 環境

- Node.js: 24.13.0
- TypeScript: 5.9.2
- @js-temporal/polyfill: 0.5.1

Node.js 24では `Temporal` がまだ組み込まれていません。
本記事ではTypeScriptの型定義を含む `@js-temporal/polyfill` を使います。

`@js-temporal/polyfill` はTC39の公式ライブラリではなく、OSSとして公開されています。
ただし、Temporalの仕様策定を進めたメンバーの一部が開発を始めたpolyfillです。
仕様と無関係な第三者実装ではありません。

```shell-session
$ npm install @js-temporal/polyfill@0.5.1
```

各コード例では次のように読み込みます。

```typescript
import { Temporal } from "@js-temporal/polyfill";
```

実行環境が `Temporal` に対応したら、この読み込みを外してグローバルの `Temporal` を使えます。
ブラウザやNode.jsの対応状況を確認してから外してください。

## Dateのつらいところ

`Date` は「ある瞬間」を表すタイムスタンプと、カレンダー上の日時を1つの型で扱います。
用途が型からわからないため、実装者がUTCとローカル時刻を意識し続ける必要があります。

ほかにも次の特徴があります。

- 月が0始まり
- 更新用メソッドが元の値を変更する
- 任意のタイムゾーンを保持できない
- 日付だけ、時刻だけを表す型がない
- 日時の加減算に手作業が必要
- 存在しない日付が自動で繰り上がる場合がある

例えば `new Date(2025, 1, 30)` はエラーにならず、2025年3月2日に繰り上がります。
入力ミスをその場で検出できません。

## Temporalの型を選ぶ

最初に「何を表したいか」で型を選びます。
ここが `Date` との大きな違いです。

|型|表すもの|使用例|
|:--|:--|:--|
|`Temporal.Instant`|世界で一意に決まる瞬間|APIの更新日時、ログの発生時刻|
|`Temporal.ZonedDateTime`|タイムゾーンを含む日時|東京で始まる会議、店舗の開店日時|
|`Temporal.PlainDate`|タイムゾーンを持たない日付|誕生日、締切日|
|`Temporal.PlainTime`|日付を持たない時刻|毎朝のアラーム|
|`Temporal.PlainDateTime`|タイムゾーンを持たない日時|タイムゾーンが未確定の予定|
|`Temporal.PlainYearMonth`|年月|請求月、有効期限|
|`Temporal.PlainMonthDay`|月日|毎年の記念日|
|`Temporal.Duration`|期間|3日、2時間30分|

名前に `Plain` が付く型はタイムゾーンを持ちません。
タイムゾーンが必要な処理で `PlainDateTime` を使うと、夏時間などを正しく計算できません。
その場合は `ZonedDateTime` を使います。

## Dateと比較したメリット

### 用途を型で表せる

誕生日を `PlainDate` にすると、時刻やタイムゾーンを誤って混ぜられません。
APIの引数や戻り値を見るだけで、値の意味がわかります。

```typescript
function calculateAge(birthday: Temporal.PlainDate): number {
  return birthday.until(Temporal.Now.plainDateISO(), {
    largestUnit: "years",
  }).years;
}
```

### 元の値を変更しない

すべての `Temporal` オブジェクトは変更できません。
`add()` や `with()` は新しい値を返すため、副作用を避けられます。

```typescript
const date = Temporal.PlainDate.from("2025-01-31");
const nextDay = date.add({ days: 1 });

console.log(date.toString()); // 2025-01-31
console.log(nextDay.toString()); // 2025-02-01
```

### 日時の計算をそのまま書ける

「3日後」や「2か月前」をミリ秒へ直す必要がありません。
月ごとの日数やうるう年もAPI側で処理されます。

```typescript
const date = Temporal.PlainDate.from("2024-02-28");

console.log(date.add({ days: 1 }).toString()); // 2024-02-29
console.log(date.add({ months: 1 }).toString()); // 2024-03-28
```

### タイムゾーンを値に含められる

`ZonedDateTime` は `Asia/Tokyo` のようなタイムゾーンIDを保持します。
別のタイムゾーンへの変換や、夏時間をまたぐ計算ができます。

```typescript
const instant = Temporal.Instant.from("2026-09-01T00:00:00Z");
const tokyo = instant.toZonedDateTimeISO("Asia/Tokyo");
const newYork = instant.toZonedDateTimeISO("America/New_York");

console.log(tokyo.toString());
// 2026-09-01T09:00:00+09:00[Asia/Tokyo]

console.log(newYork.toString());
// 2026-08-31T20:00:00-04:00[America/New_York]
```

### 日時の精度が高い

`Date` はミリ秒まで扱えます。
`Temporal.Instant` はナノ秒まで扱えます。

```typescript
const instant = Temporal.Instant.from("2026-09-01T00:00:00.123456789Z");

console.log(instant.epochMilliseconds); // 1788220800123
console.log(instant.epochNanoseconds); // 1788220800123456789n
```

## Dateと比較したデメリット

### すべての実行環境で使えるわけではない

`Temporal` はStage 4ですが、MDNではまだBaselineではありません。
2026年9月時点ではSafariなどに未対応環境があり、Node.jsは26から対応しています。
対象環境によってはpolyfillが必要です。

polyfillを使うと、依存関係と配信するJavaScriptのサイズが増えます。
フロントエンドでは対応ブラウザとバンドルサイズを確認してください。
また、`@js-temporal/polyfill` 0.5.1はアルファ版です。
更新時は変更内容を確認してください。

### 型とAPIが多い

`Date` は1つの型に機能が集まっています。
`Temporal` は用途ごとに型が分かれ、200を超えるメソッドがあります。
慣れるまでは、どの型を選ぶか迷いやすいです。

まずは次の3つから使うと理解しやすいです。

- 日付のみは `PlainDate`
- 一意な時刻は `Instant`
- タイムゾーン付き日時は `ZonedDateTime`

### Dateとの受け渡しが残る

既存のライブラリやWeb APIは `Date` を受け取る場合があります。
一度にすべてを移行すると、変換コードが増えます。

境界で `Date` と `Temporal` を変換し、内側から少しずつ移行するのがおすすめです。

### 演算子で比較できない

`Date` は数値へ暗黙変換されるため、大小演算子で比較できます。
`Temporal` は暗黙変換を避ける設計なので、`compare()` や `equals()` を使います。

コードは少し長くなりますが、何を比較しているかが明確になります。

## よく使うAPIをDateから移行する

以降は同じ処理をBeforeの `Date` とAfterの `Temporal` で比べます。

### 現在日時を取得する

`Date` は現在の瞬間とローカル日時を1つの値で返します。
`Temporal.Now` は必要な表現を選べます。

#### Before

```typescript
const now = new Date();
const timestamp = Date.now();
```

#### After

```typescript
const instant = Temporal.Now.instant();
const localDate = Temporal.Now.plainDateISO();
const tokyoDateTime = Temporal.Now.zonedDateTimeISO("Asia/Tokyo");
```

### 日付を作る

`Date` の数値コンストラクターは月が0始まりです。
`PlainDate` は文字列でもオブジェクトでも月を1始まりで指定します。

#### Before

```typescript
const date = new Date(2026, 8, 1); // 2026年9月1日
```

#### After

```typescript
const dateFromString = Temporal.PlainDate.from("2026-09-01");
const dateFromFields = Temporal.PlainDate.from({
  year: 2026,
  month: 9,
  day: 1,
});
```

`Temporal.PlainDate.from("2025-02-30")` のような存在しない日付は `RangeError` になります。
文字列なら入力ミスを早めに検出できます。

### 年月日を取得する

`Date#getMonth()` は0始まりですが、`PlainDate#month` は1始まりです。

#### Before

```typescript
const date = new Date(2026, 8, 1);

const year = date.getFullYear();
const month = date.getMonth() + 1;
const day = date.getDate();
```

#### After

```typescript
const date = Temporal.PlainDate.from("2026-09-01");

const { year, month, day } = date;
```

### 日付を加算する

`Date#setDate()` は元の値を変更します。
変更を避けるにはコピーが必要です。

#### Before

```typescript
const date = new Date(2026, 8, 1);
const nextWeek = new Date(date);
nextWeek.setDate(nextWeek.getDate() + 7);
```

#### After

```typescript
const date = Temporal.PlainDate.from("2026-09-01");
const nextWeek = date.add({ weeks: 1 });
```

月の加算では、移動先に同じ日がなければ既定で月末に収まります。

```typescript
const date = Temporal.PlainDate.from("2025-01-31");

console.log(date.add({ months: 1 }).toString()); // 2025-02-28
```

自動調整せずエラーにしたい場合は `overflow: "reject"` を指定します。

```typescript
date.add({ months: 1 }, { overflow: "reject" }); // RangeError
```

### 日付の差を求める

`Date` ではミリ秒の差を自分で日数へ変換します。
この計算は、ローカル時刻で夏時間をまたぐ場合に24時間と1日が一致しないことがあります。

#### Before

```typescript
const start = new Date(2026, 8, 1);
const end = new Date(2026, 8, 10);
const millisecondsPerDay = 24 * 60 * 60 * 1_000;
const days = (end.getTime() - start.getTime()) / millisecondsPerDay;
```

#### After

```typescript
const start = Temporal.PlainDate.from("2026-09-01");
const end = Temporal.PlainDate.from("2026-09-10");
const duration = start.until(end);

console.log(duration.days); // 9
```

年や月を含む差が欲しい場合は、最大の単位を指定します。

```typescript
const duration = Temporal.PlainDate.from("2024-01-15").until(
  Temporal.PlainDate.from("2026-03-20"),
  { largestUnit: "years" },
);

console.log(duration.toString()); // P2Y2M5D
```

### 日付を更新する

`with()` は指定した部分だけを置き換えた新しい値を返します。

#### Before

```typescript
const date = new Date(2026, 8, 1);
const changed = new Date(date);
changed.setMonth(11);
changed.setDate(31);
```

#### After

```typescript
const date = Temporal.PlainDate.from("2026-09-01");
const changed = date.with({ month: 12, day: 31 });
```

### 日付を比較する

同じ日時かだけを調べる場合は `equals()` も使えます。

#### Before

```typescript
const left = new Date("2026-09-01T00:00:00Z");
const right = new Date("2026-09-02T00:00:00Z");

const order = left.getTime() - right.getTime();
const isSame = left.getTime() === right.getTime();
```

#### After

```typescript
const left = Temporal.Instant.from("2026-09-01T00:00:00Z");
const right = Temporal.Instant.from("2026-09-02T00:00:00Z");

const order = Temporal.Instant.compare(left, right); // -1
const isSame = left.equals(right); // false
```

`compare()` は左が小さければ `-1`、同じなら `0`、大きければ `1` を返します。

### タイムゾーンを変換する

`Date` 自体は任意のタイムゾーンを保持できません。
表示時に `Intl.DateTimeFormat` へタイムゾーンを渡します。

#### Before

```typescript
const date = new Date("2026-09-01T00:00:00Z");
const formatter = new Intl.DateTimeFormat("ja-JP", {
  dateStyle: "medium",
  timeStyle: "medium",
  timeZone: "Asia/Tokyo",
});

const formatted = formatter.format(date);
```

#### After

```typescript
const instant = Temporal.Instant.from("2026-09-01T00:00:00Z");
const tokyo = instant.toZonedDateTimeISO("Asia/Tokyo");

console.log(tokyo.hour); // 9
console.log(tokyo.timeZoneId); // Asia/Tokyo
```

表示だけなら `toLocaleString()` を使えます。

```typescript
const formatted = tokyo.toLocaleString("ja-JP", {
  dateStyle: "medium",
  timeStyle: "medium",
});
```

### ISO 8601形式へ変換する

APIへ送る一意な時刻には `Instant` が向いています。

#### Before

```typescript
const isoString = new Date("2026-09-01T00:00:00Z").toISOString();
// 2026-09-01T00:00:00.000Z
```

#### After

```typescript
const isoString = Temporal.Instant.from(
  "2026-09-01T00:00:00Z",
).toString();
// 2026-09-01T00:00:00Z
```

## DateとTemporalを相互変換する

既存コードとの境界ではUnix時間のミリ秒を使うと変換できます。

### DateからTemporal.Instantへ変換する

```typescript
const date = new Date("2026-09-01T00:00:00Z");
const instant = Temporal.Instant.fromEpochMilliseconds(date.getTime());
```

### Temporal.InstantからDateへ変換する

```typescript
const instant = Temporal.Instant.from("2026-09-01T00:00:00Z");
const date = new Date(instant.epochMilliseconds);
```

この変換では `Date` に合わせてミリ秒未満の精度が失われます。

`PlainDate` は一意な瞬間ではないため、そのまま `Date` へ変換できません。
時刻とタイムゾーンを決めてから変換します。

```typescript
const plainDate = Temporal.PlainDate.from("2026-09-01");
const startOfDay = plainDate.toZonedDateTime({
  timeZone: "Asia/Tokyo",
  plainTime: Temporal.PlainTime.from("00:00"),
});
const date = new Date(startOfDay.epochMilliseconds);
```

## 段階的に移行する

すべての `Date` を一度に置き換える必要はありません。
次の順で進めると、影響を小さくできます。

1. 値が「日付」「瞬間」「タイムゾーン付き日時」のどれかを決める
2. 新しく書く処理の内側を `Temporal` にする
3. 既存コードとの境界で `Date` と相互変換する
4. APIやデータベースには文字列かUnix時間を渡す
5. 対応環境が揃ったらpolyfillを外す

置き換えの目安は次のとおりです。

|Dateで行っていること|移行先|
|:--|:--|
|`Date.now()`|`Temporal.Now.instant()`|
|日付だけを保持する|`Temporal.PlainDate`|
|時刻だけを保持する|`Temporal.PlainTime`|
|ログや更新日時を保持する|`Temporal.Instant`|
|地域にひもづく予定を保持する|`Temporal.ZonedDateTime`|
|`setDate()` などで更新する|`add()`、`subtract()`、`with()`|
|ミリ秒を引いて差を求める|`since()`、`until()`|
|`getTime()` で比較する|`compare()`、`equals()`|

## TemporalとDateの今後

`Temporal` は `Date` の後継として作られたAPIです。
MDNでも `Date` の完全な代替として設計されたと説明されています。

ただし、ここでの代替は「新しい日時処理を `Temporal` で実装できる」という意味です。
`Date` をJavaScriptから削除するという意味ではありません。

既存のWebサイトやライブラリには、`Date` を使ったコードが多く残っています。
JavaScriptは後方互換性を重視するため、`Date` の削除は現実的ではありません。
現時点でも、`Date` を削除したり非推奨にしたりする計画は発表されていません。

今後は新しい日時処理で `Temporal` を使い、既存APIとの境界で `Date` へ変換する形が増えると考えられます。
`Temporal` は `Date` の後継ですが、両者は長期間共存します。

## 注意点

### 日付だけの文字列をInstantへ渡さない

`Instant` にはUTCオフセットが必要です。
日付だけなら `PlainDate` を使います。

```typescript
Temporal.PlainDate.from("2026-09-01"); // OK
Temporal.Instant.from("2026-09-01"); // RangeError
```

### 日と24時間を同じものとして扱わない

夏時間がある地域では、カレンダー上の1日が24時間とは限りません。
翌日の同じ時刻が欲しいなら `ZonedDateTime` へ `{ days: 1 }` を加えます。
24時間後が欲しいなら `{ hours: 24 }` を加えます。

```typescript
const start = Temporal.ZonedDateTime.from(
  "2025-03-08T12:00:00-05:00[America/New_York]",
);

console.log(start.add({ days: 1 }).toString());
// 2025-03-09T12:00:00-04:00[America/New_York]

console.log(start.add({ hours: 24 }).toString());
// 2025-03-09T13:00:00-04:00[America/New_York]
```

### 永続化する型を決める

一意な時刻を保存するなら、`Instant` の文字列かUnix時間が扱いやすいです。
地域の予定では、時刻だけでなく `Asia/Tokyo` のようなタイムゾーンIDも保存します。
UTCオフセットだけでは、将来の夏時間や制度変更を正しく反映できません。

## おわりに

`Temporal` を使うと、日時の意味を型で表し、安全に計算できます。
まずは日付だけを扱う処理を `PlainDate` へ移すと、メリットをつかみやすいです :relaxed:

## 参考リンク

- https://github.com/tc39/proposal-temporal
- https://tc39.es/proposal-temporal/docs/
- https://www.npmjs.com/package/@js-temporal/polyfill
- https://github.com/js-temporal/temporal-polyfill
