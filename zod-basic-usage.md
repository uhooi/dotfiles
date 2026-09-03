---
title: Zodのメリット・デメリットと基本的な使い方
tags:
  - zod
  - TypeScript
  - JavaScript
  - Node.js
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

Zodのメリットとデメリット、基本的な使い方を紹介します。
外部から受け取った値を検証し、安全にTypeScriptのコードで扱えるようになることを目指します。

## 「Zod」とは？

TypeScript向けの、スキーマ宣言とデータ検証のライブラリです。

https://github.com/colinhacks/zod

文字列や数値、オブジェクトなどの形を「スキーマ」として定義します。
APIのレスポンスやフォームの入力値がスキーマに合うか、実行時に検証できます。

TypeScriptの型は、コンパイル後のJavaScriptには残りません。
そのため、型を書くだけでは外部から届いた値を実行時に検証できません。
Zodは、この境界で値を検証するために使えます。

## 環境

- Node.js: 24.13.0
- npm: 11.6.2
- TypeScript: 5.9.2
- Zod: 4.4.3

Zod 4はTypeScript 5.5以降でテストされています。
`tsconfig.json` では `strict` モードを有効にします。

## Zodのメリット

### 実行時に値を検証できる

APIのレスポンスやフォームの入力値は、TypeScriptの型だけでは保証できません。
Zodを使うと、値の型や範囲を実行時に検証できます。

### スキーマからTypeScriptの型を作れる

`z.infer` を使うと、スキーマからTypeScriptの型を取り出せます。
検証ルールと型を別々に書かずに済むため、両者のずれを防げます。

### 小さなスキーマを組み合わせられる

文字列や数値のスキーマを組み合わせて、オブジェクトや配列のスキーマを作れます。
作成したスキーマは、別のスキーマでも再利用できます。

### エラーの場所を調べやすい

検証に失敗すると、`ZodError` から失敗した場所や理由を取得できます。
フォームのエラー表示や、APIのエラーレスポンスを作るときに役立ちます。

## Zodのデメリット

### スキーマを書く必要がある

TypeScriptの型とは別に、ZodのAPIを使ってスキーマを定義します。
既存の型が多いプロジェクトへ導入する場合は、スキーマを追加する手間がかかります。

### 学ぶAPIが増える

`optional()` や `nullable()`、`refine()` など、要件に合わせてAPIを使い分けます。
複雑な検証や変換では、入力型と出力型の違いも理解する必要があります。

### 実行時の処理とバンドルサイズが増える

Zodは実行時に検証するため、処理時間がかかります。
ブラウザで使う場合は、JavaScriptのバンドルにもライブラリが追加されます。
性能や容量が厳しい場所では、検証する境界を絞るとよいです。

### `parse()` は失敗時に例外を投げる

`parse()` を使う場合は、必要に応じて `try/catch` で例外を処理します。
例外を使わずに分岐したい場合は、`safeParse()` を使います。

## 基本的な使い方

### インストールする

以下を実行します。

```shell-session
$ npm install zod
```

`tsconfig.json` で `strict` を有効にします。

```json:tsconfig.json
{
  "compilerOptions": {
    "strict": true
  }
}
```

### スキーマを定義する

ユーザー情報を表すスキーマを定義します。

```typescript:user.ts
import * as z from "zod";

const UserSchema = z.object({
  id: z.number().int().positive(),
  name: z.string().min(1),
  email: z.email(),
  role: z.enum(["admin", "member"]),
  bio: z.string().max(160).optional(),
  tags: z.array(z.string()),
});
```

よく使うAPIを種類ごとに紹介します。

#### プリミティブ

JavaScriptのプリミティブ値を検証します。

|API|検証する値|
|:--|:--|
|`z.string()`|文字列|
|`z.number()`|数値|
|`z.bigint()`|`bigint`|
|`z.boolean()`|真偽値|
|`z.symbol()`|`symbol`|
|`z.undefined()`|`undefined`|
|`z.null()`|`null`|

#### オブジェクトとコレクション

複数の値をまとめたデータを検証します。

|API|検証する値|
|:--|:--|
|`z.object({...})`|キーごとにスキーマを指定したオブジェクト|
|`z.strictObject({...})`|未定義のプロパティを許可しないオブジェクト|
|`z.array(schema)`|同じ型の値を持つ配列|
|`z.tuple([...])`|要素ごとに型を指定した固定長の配列|
|`z.record(keySchema, valueSchema)`|キーと値のスキーマを指定したオブジェクト|
|`z.date()`|`Date` オブジェクト|

#### オブジェクトスキーマの操作

定義済みのオブジェクトスキーマから、新しいスキーマを作ります。

|API|説明|
|:--|:--|
|`.extend({...})`|プロパティを追加する|
|`.pick({...})`|指定したプロパティだけを残す|
|`.omit({...})`|指定したプロパティを除く|
|`.partial()`|すべてのプロパティを省略可能にする|
|`.required()`|すべてのプロパティを必須にする|
|`.catchall(schema)`|未定義のプロパティを指定したスキーマで検証する|

#### 値の候補と組み合わせ

受け付ける値を候補から指定したり、複数のスキーマを組み合わせたりします。

|API|説明|
|:--|:--|
|`z.literal(value)`|指定した1つの値だけを許可する|
|`z.enum([...])`|指定した候補のいずれかを許可する|
|`z.union([...])`|複数のスキーマのいずれかを許可する|
|`z.discriminatedUnion(key, [...])`|共通のキーでオブジェクトの種類を判定する|

#### 省略と空値

スキーマの値を省略できるようにしたり、初期値を指定したりします。

|API|説明|
|:--|:--|
|`.optional()`|`undefined` またはプロパティの省略を許可する|
|`.nullable()`|`null` を許可する|
|`.nullish()`|`null`、`undefined`、プロパティの省略を許可する|
|`.default(value)`|入力が `undefined` の場合に初期値を返す|

#### 文字列

文字列の長さや内容を検証します。

|API|説明|
|:--|:--|
|`.min(length)`|最小文字数を指定する|
|`.max(length)`|最大文字数を指定する|
|`.length(length)`|文字数を指定する|
|`.nonempty()`|空文字ではないか検証する|
|`.regex(pattern)`|正規表現に一致するか検証する|
|`.startsWith(prefix)`|指定した文字列で始まるか検証する|
|`.endsWith(suffix)`|指定した文字列で終わるか検証する|
|`.includes(value)`|指定した文字列を含むか検証する|
|`.uppercase()`|文字列全体に小文字の `a-z` が含まれないか検証する|
|`.lowercase()`|文字列全体に大文字の `A-Z` が含まれないか検証する|

#### 文字列の変換

文字列を検証したあと、変換した値を返します。

|API|説明|
|:--|:--|
|`.trim()`|先頭と末尾の空白を取り除く|
|`.toLowerCase()`|文字列全体を小文字に変換する|
|`.toUpperCase()`|文字列全体を大文字に変換する|
|`.normalize(form?)`|Unicode文字列を正規化する|

#### 文字列の形式

メールアドレスやUUIDなど、決まった形式の文字列を検証します。

|API|説明|
|:--|:--|
|`z.email()`|メールアドレスを検証する|
|`z.url()`|URLを検証する|
|`z.httpUrl()`|HTTPまたはHTTPSのURLを検証する|
|`z.uuid()`|UUIDを検証する|
|`z.ipv4()`|IPv4アドレスを検証する|
|`z.ipv6()`|IPv6アドレスを検証する|
|`z.iso.date()`|`YYYY-MM-DD` 形式の日付を検証する|
|`z.iso.time()`|ISO 8601形式の時刻を検証する|
|`z.iso.datetime()`|ISO 8601形式の日時を検証する|
|`z.iso.duration()`|ISO 8601形式の期間を検証する|

#### 数値の検証

数値の種類や範囲を検証します。

|API|説明|
|:--|:--|
|`.int()`|整数か検証する|
|`.positive()`|0より大きいか検証する|
|`.negative()`|0より小さいか検証する|
|`.nonnegative()`|0以上か検証する|
|`.min(value)`|最小値を指定する|
|`.gte(value)`|指定した値以上か検証する（`.min()` の別名）|
|`.max(value)`|最大値を指定する|

#### 配列の検証

配列の要素数を検証します。

|API|説明|
|:--|:--|
|`.min(length)`|最小要素数を指定する|
|`.max(length)`|最大要素数を指定する|
|`.nonempty()`|1つ以上の要素があるか検証する|
|`.length(length)`|要素数を指定する|

#### 変換と独自の検証

入力値を変換したり、組み込みAPIにない条件を追加したりします。

|API|説明|
|:--|:--|
|`z.coerce.number()`|入力を `Number()` で数値へ変換する|
|`z.coerce.string()`|入力を `String()` で文字列へ変換する|
|`.refine(predicate)`|関数を使って独自の条件を追加する|
|`.superRefine((value, ctx) => {...})`|複数のエラーや、種類を指定したエラーを追加する|
|`.transform(transformer)`|検証後の値を別の値へ変換する|

### `z.strictObject()` で未定義のプロパティを禁止する

`z.object()` は、スキーマにないプロパティを既定で検証結果から取り除きます。
`z.strictObject()` を使うと、未定義のプロパティが含まれている場合に `parse()` が `ZodError` をスローします。

```typescript
const UserSchema = z.strictObject({
  id: z.number(),
  name: z.string(),
});

UserSchema.parse({
  id: 1,
  name: "Taro",
}); // 検証に成功する

UserSchema.parse({
  id: 1,
  name: "Taro",
  role: "admin",
}); // roleが未定義のプロパティのため、ZodErrorをスローする
```

想定外のプロパティを受け付けたくない場合に向いています。

### `.catchall()` で未定義のプロパティを検証する

`z.object()` は、スキーマにないプロパティを既定で検証結果から取り除きます。
`.catchall()` を使うと、未定義のすべてのプロパティを同じスキーマで検証できます。

```typescript
const MetadataSchema = z
  .object({
    id: z.number(),
  })
  .catchall(z.string());

MetadataSchema.parse({
  id: 1,
  source: "api",
}); // 検証に成功する

MetadataSchema.parse({
  id: 1,
  retryCount: 3,
}); // retryCountが文字列ではないため、検証に失敗する
```

プロパティ名は決まっていないものの、値の型は決まっているオブジェクトに向いています。

### `.superRefine()` で複数のエラーを追加する

`.refine()` は、1回の呼び出しで1つの独自エラーを作ります。
`.superRefine()` は `ctx.addIssue()` を複数回呼び出し、1回の検証で複数のエラーを作れます。

```typescript
const PasswordSchema = z
  .object({
    password: z.string(),
    confirmPassword: z.string(),
  })
  .superRefine((value, ctx) => {
    if (value.password !== value.confirmPassword) {
      ctx.addIssue({
        code: "custom",
        path: ["confirmPassword"],
        message: "パスワードが一致しません",
      });
    }

    if (!/[0-9]/.test(value.password)) {
      ctx.addIssue({
        code: "custom",
        path: ["password"],
        message: "数字を1文字以上含めてください",
      });
    }
  });

const result = PasswordSchema.safeParse({
  password: "password",
  confirmPassword: "different",
});

if (!result.success) {
  console.log(result.error.issues);
}
```

この例では、パスワードの不一致と数字がないことを1回の検証で報告します。

### `parse()` で検証する

`parse()` は、検証に成功すると型が付いた値を返します。
失敗すると `ZodError` を投げます。

```typescript:user.ts
const input: unknown = {
  id: 1,
  name: "Uhooi",
  email: "uhooi@example.com",
  role: "member",
  tags: ["TypeScript", "Zod"],
};

const user = UserSchema.parse(input);

console.log(user.name);
```

外部APIのレスポンスを検証する場合も、同じように使えます。

```typescript
const response = await fetch("https://example.com/api/users/1");
const json: unknown = await response.json();
const user = UserSchema.parse(json);
```

### `safeParse()` で例外を使わずに検証する

`safeParse()` は例外を投げません。
戻り値の `success` を確認し、成功と失敗を分岐します。

```typescript:user.ts
const result = UserSchema.safeParse({
  id: -1,
  name: "",
  email: "invalid-email",
  role: "guest",
  tags: [],
});

if (!result.success) {
  for (const issue of result.error.issues) {
    console.error(issue.path, issue.message);
  }
} else {
  console.log(result.data);
}
```

入力エラーを画面へ表示する場合など、検証の失敗を通常の分岐として扱いたいときに向いています。

### スキーマから型を取り出す

`z.infer` を使うと、スキーマからTypeScriptの型を作れます。

```typescript:user.ts
type User = z.infer<typeof UserSchema>;

const typedUser: User = {
  id: 1,
  name: "Uhooi",
  email: "uhooi@example.com",
  role: "admin",
  tags: ["TypeScript"],
};
```

この例では、`User` は以下に相当します。

```typescript
type User = {
  id: number;
  name: string;
  email: string;
  role: "admin" | "member";
  bio?: string | undefined;
  tags: string[];
};
```

スキーマを変更すると型にも反映されます。
スキーマを正として管理すると、検証ルールと型を同期できます。

## `parse()` と `safeParse()` の使い分け

|メソッド|検証に成功した場合|検証に失敗した場合|向いている場面|
|:--|:--|:--|:--|
|`parse()`|検証済みの値を返す|`ZodError` を投げる|失敗時に処理を中断したい場合|
|`safeParse()`|`{ success: true, data }` を返す|`{ success: false, error }` を返す|成功と失敗を分岐したい場合|

非同期の `refine()` や変換を含む場合は、`parseAsync()` または `safeParseAsync()` を使います。

## おわりに

Zodを使うと、外部から受け取った値を実行時に検証し、そのまま型が付いた値として扱えます。
まずはAPIやフォームなど、信頼できない値が入る境界から使ってみてください :relaxed:

## 参考リンク

- https://zod.dev/
- https://zod.dev/basics
- https://zod.dev/api
- https://github.com/colinhacks/zod/blob/main/packages/zod/package.json
