---
title: Kyselyの基本的な使い方と主要API
tags:
  - kysely
  - TypeScript
  - SQL
  - PostgreSQL
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

型安全なSQLクエリビルダー「Kysely」の特徴と基本的な使い方を紹介します。
SQLを直接書く場合との違い、マイグレーション、よく使うAPIもまとめます。

## 「Kysely」とは？

TypeScript向けの型安全なSQLクエリビルダーです。

https://kysely.dev/

ORMではなく、SQLに近いAPIでクエリを組み立てます。
PostgreSQL、MySQL、Microsoft SQL Server、SQLite、PGliteのDialect（データベースごとの差を吸収する仕組み）が標準で用意されています。

## 環境

- Kysely: 0.29.5
- TypeScript: 5.4以上
- PostgreSQL
- Node.js

TypeScriptは `strict` モードを有効にする必要があります。
公式はコンパイル速度を改善するため、TypeScript 5.9以上を勧めています。

## SQL直書きと比べたメリット・デメリット

### メリット

#### テーブル名やカラム名を型チェックできる

存在しないテーブルやカラムを指定すると、コンパイルエラーになります。
値の型もチェックされるため、例えば数値のカラムへ文字列を渡すミスに気づけます。

スキーマを変更したときも、修正が必要なクエリをTypeScriptのコンパイラが教えてくれます。

#### 戻り値の型を推論できる

`select()` で選んだカラムから戻り値の型が決まります。
JOINやエイリアスを使っても型が引き継がれるため、手動で型を付ける場面が減ります。

#### 動的な条件を組み立てやすい

通常のTypeScriptとして条件分岐や関数を使えます。
検索条件が任意の一覧画面など、条件によってSQLが変わる処理を書きやすいです。

#### SQLに近い形で書ける

`selectFrom()`、`where()`、`innerJoin()` など、SQLに対応した名前のAPIが用意されています。
ORM独自のリレーション定義を覚えなくても、SQLの知識をそのまま使えます。

#### 値をパラメータとして渡せる

APIへ渡した値はプレースホルダーへ変換されます。
生SQLが必要な場合も、`sql` タグの埋め込み値はパラメータとして扱われます。

### デメリット

#### データベースの型定義が必要

Kyselyが型チェックするには、テーブルとカラムを表すTypeScriptの型が必要です。
手動でも書けますが、本番では `kysely-codegen` などによる自動生成が勧められています。

型定義と実際のスキーマがずれると、コンパイルが通っても実行時に失敗する可能性があります。

#### SQLより長くなることがある

単純なクエリでも、メソッドチェーンや `execute()` が必要です。
複雑な集計やデータベース固有の機能は、生SQLのほうが読みやすい場合があります。

#### SQLの知識は必要

KyselyはSQLを隠すORMではありません。
JOIN、サブクエリ、トランザクション、インデックスなどの知識は必要です。

#### 実行時の値までは保証しない

Kyselyが扱うのはTypeScript上の型です。
実行時に返るJavaScriptの値は `pg` などのドライバーが決めます。

例えばデータベースの `bigint` や日時がどの型で返るかを確認し、実態に合う型を定義する必要があります。

### 使い分け

|方法|向いている場面|
|:--|:--|
|Kysely|TypeScriptで型安全にCRUDや動的な検索条件を書きたい|
|SQL直書き|複雑な集計やデータベース固有の機能をSQLのまま表したい|
|Kyselyと `sql` タグの併用|基本は型安全に書き、一部だけ生SQLを使いたい|

どちらか一方に統一する必要はありません。
普段はクエリビルダーを使い、表現しづらい箇所だけ `sql` タグへ逃がせるのがKyselyのよさです。

## 基本的な使い方

PostgreSQLを例に説明します。

### インストールする

Kysely本体、PostgreSQLドライバー、ドライバーの型定義をインストールします。

```shell-session
$ npm install kysely pg
$ npm install --save-dev @types/pg
```

`tsconfig.json` で `strict` を有効にします。

```json:tsconfig.json
{
  "compilerOptions": {
    "strict": true
  }
}
```

### データベースの型を定義する

キーがテーブル名、値がカラムの型となる `Database` インターフェースを定義します。

```typescript:src/types.ts
import type {
  ColumnType,
  Generated,
  Insertable,
  Selectable,
  Updateable,
} from 'kysely'

export interface Database {
  user: UserTable
  post: PostTable
}

export interface UserTable {
  id: Generated<number>
  name: string
  email: string
  created_at: ColumnType<Date, string | undefined, never>
}

export interface PostTable {
  id: Generated<number>
  user_id: number
  title: string
  body: string
  published: boolean
  created_at: ColumnType<Date, string | undefined, never>
}

export type User = Selectable<UserTable>
export type NewUser = Insertable<UserTable>
export type UserUpdate = Updateable<UserTable>
```

`Generated<T>` はデータベースが生成するカラムを表します。
INSERT時に省略できるため、自動採番のIDなどに使います。

`ColumnType<SelectType, InsertType, UpdateType>` は、SELECT、INSERT、UPDATEで異なる型を指定します。
上の `created_at` は取得時が `Date`、追加時は文字列または省略、更新は不可です。

### 接続する

`Kysely` へ `Database` と `PostgresDialect` を渡します。

```typescript:src/database.ts
import { Kysely, PostgresDialect } from 'kysely'
import { Pool } from 'pg'
import type { Database } from './types.js'

const dialect = new PostgresDialect({
  pool: new Pool({
    connectionString: process.env.DATABASE_URL,
    max: 10,
  }),
})

export const db = new Kysely<Database>({ dialect })
```

通常はデータベースごとに `Kysely` のインスタンスを1つだけ作ります。
アプリケーションを終了するときは `await db.destroy()` で接続を閉じます。

### SELECTする

`selectFrom()` でテーブルを指定し、`select()` で取得するカラムを選びます。

```typescript
const users = await db
  .selectFrom('user')
  .select(['id', 'name', 'email'])
  .where('name', 'like', 'Uhooi%')
  .orderBy('created_at', 'desc')
  .limit(20)
  .execute()
```

`users` は `{ id: number; name: string; email: string }[]` と推論されます。

1件だけ取得する場合は `executeTakeFirst()` を使います。
0件なら `undefined` が返ります。

```typescript
const user = await db
  .selectFrom('user')
  .selectAll()
  .where('id', '=', 1)
  .executeTakeFirst()
```

必ず1件ある前提なら `executeTakeFirstOrThrow()` を使います。
0件の場合は例外が発生します。

### INSERTする

`insertInto()` と `values()` を使います。
PostgreSQLでは `returning()` で追加した行を取得できます。

```typescript
const user = await db
  .insertInto('user')
  .values({
    name: 'Uhooi',
    email: 'uhooi@example.com',
  })
  .returningAll()
  .executeTakeFirstOrThrow()
```

### UPDATEする

`updateTable()` と `set()` を使います。

```typescript
const user = await db
  .updateTable('user')
  .set({ email: 'new@example.com' })
  .where('id', '=', 1)
  .returningAll()
  .executeTakeFirstOrThrow()
```

`where()` を付け忘れると全件が更新されます。
Kyselyが自動で防ぐわけではないため、SQL直書きと同じように注意してください。

### DELETEする

`deleteFrom()` を使います。

```typescript
const result = await db
  .deleteFrom('user')
  .where('id', '=', 1)
  .executeTakeFirst()

console.log(result.numDeletedRows)
```

DELETEも `where()` を付け忘れると全件が削除されます。

### JOINする

`innerJoin()` などでテーブルを結合します。
同名のカラムは `as` で別名を付けると扱いやすいです。

```typescript
const posts = await db
  .selectFrom('post')
  .innerJoin('user', 'user.id', 'post.user_id')
  .select([
    'post.id',
    'post.title',
    'user.name as author_name',
  ])
  .where('post.published', '=', true)
  .execute()
```

`author_name` も戻り値の型へ反映されます。

### 動的に条件を追加する

クエリビルダーはイミュータブルです。
条件を追加した戻り値を同じ変数へ代入します。

```typescript
interface SearchUsersParams {
  name?: string
  email?: string
}

async function searchUsers(params: SearchUsersParams) {
  let query = db.selectFrom('user').selectAll()

  if (params.name !== undefined) {
    query = query.where('name', 'like', `%${params.name}%`)
  }

  if (params.email !== undefined) {
    query = query.where('email', '=', params.email)
  }

  return await query.execute()
}
```

### トランザクションを使う

`transaction().execute()` のコールバック内で `trx` を使います。
コールバックが例外を投げるとロールバックされ、正常に終了するとコミットされます。

```typescript
const post = await db.transaction().execute(async (trx) => {
  const user = await trx
    .insertInto('user')
    .values({
      name: 'Uhooi',
      email: 'uhooi@example.com',
    })
    .returning('id')
    .executeTakeFirstOrThrow()

  return await trx
    .insertInto('post')
    .values({
      user_id: user.id,
      title: 'Hello, Kysely!',
      body: 'Kyselyを使ってみました。',
      published: false,
    })
    .returningAll()
    .executeTakeFirstOrThrow()
})
```

### 生SQLを使う

クエリビルダーだけで表しづらい処理には `sql` タグを使います。

```typescript
import { sql } from 'kysely'

const domain = 'example.com'

const users = await db
  .selectFrom('user')
  .selectAll()
  .where(sql<boolean>`email like ${`%@${domain}`}`)
  .execute()
```

`${}` へ埋め込んだ値はSQLへ直接連結されず、パラメータとして渡されます。
テーブル名やカラム名などの識別子を動的に組み立てる場合は、値と同じ扱いではないため注意してください。

クエリ全体を生SQLで実行することもできます。
戻り値の型は自分で指定します。

```typescript
import { sql } from 'kysely'

interface UserCount {
  count: number
}

const result = await sql<UserCount>`
  select count(*)::integer as count
  from "user"
`.execute(db)

console.log(result.rows[0]?.count)
```

## マイグレーション

Kyselyには、マイグレーションの作成と実行に使えるAPIがあります。
`up()` で次の状態へ進め、`down()` で前の状態へ戻します。

### Kyselyと生SQLを使い分ける

通常のDDLはKyselyのSchema APIで書くのがおすすめです。
Kyselyで表しづらい処理だけ `sql` タグを使うと、読みやすさとSQLの自由度を両立できます。

|方式|向いている場面|
|:--|:--|
|KyselyのSchema API|テーブル、カラム、インデックスの作成や変更|
|`sql` タグ|データベース固有の型、関数、制約、複雑なデータ移行|
|生の `.sql` ファイル|DBAがSQLを直接レビューし、別のツールで実行する運用|

Kyselyのマイグレーション機能を使うなら、TypeScriptのファイル内でSchema APIと `sql` タグを併用するのが扱いやすいです。

### マイグレーションファイルを作る

ファイル名の英数字順で実行されます。
公式はISO 8601形式の日付をファイル名の先頭へ付ける方法を勧めています。

```typescript:migrations/2026-09-03T00-00-00_create_user.ts
import { type Kysely, sql } from 'kysely'

export async function up(db: Kysely<any>): Promise<void> {
  await db.schema
    .createTable('user')
    .addColumn('id', 'serial', (column) => column.primaryKey())
    .addColumn('name', 'varchar', (column) => column.notNull())
    .addColumn('email', 'varchar', (column) => column.notNull())
    .addColumn('created_at', 'timestamp', (column) =>
      column.defaultTo(sql`now()`).notNull(),
    )
    .execute()

  await sql`
    create unique index user_email_lower_index
    on "user" (lower("email"))
  `.execute(db)
}

export async function down(db: Kysely<any>): Promise<void> {
  await db.schema.dropTable('user').execute()
}
```

マイグレーションでは、アプリで使っている `Kysely<Database>` ではなく `Kysely<any>` を使います。
過去のマイグレーションは、現在のアプリの型や関数へ依存させないためです。

マイグレーションファイルは作成時点の状態で固定します。
あとからテーブル名を変えても、適用済みのファイルは書き換えず、新しいマイグレーションを追加します。

### マイグレーションを実行する

`FileMigrationProvider` でファイルを読み込み、`Migrator` で実行します。

```typescript:scripts/migrate.ts
import { promises as fs } from 'node:fs'
import * as path from 'node:path'
import { fileURLToPath } from 'node:url'
import {
  FileMigrationProvider,
  Migrator,
} from 'kysely/migration'
import { db } from '../src/database.js'

const migrationFolder = path.resolve(
  path.dirname(fileURLToPath(import.meta.url)),
  '../migrations',
)

const migrator = new Migrator({
  db,
  provider: new FileMigrationProvider({
    fs,
    path,
    migrationFolder,
  }),
})

const { error, results } = await migrator.migrateToLatest()

for (const result of results ?? []) {
  console.log(`${result.migrationName}: ${result.status}`)
}

await db.destroy()

if (error !== undefined) {
  throw error
}
```

`migrateToLatest()` は未適用のマイグレーションをすべて実行します。
Kyselyはデータベース上でロックを取得するため、複数のサーバーから同時に呼ばれてもマイグレーションは1回ずつ実行されます。

本番へ適用する前に、検証用データベースで `up()` と `down()` の両方を確認しましょう。

## 主要なAPI一覧

### クエリの起点

|API|説明|
|:--|:--|
|`selectFrom()`|SELECTするテーブルを指定する|
|`selectNoFrom()`|FROM句なしのSELECTを作る|
|`insertInto()`|INSERTするテーブルを指定する|
|`updateTable()`|UPDATEするテーブルを指定する|
|`deleteFrom()`|DELETEするテーブルを指定する|
|`with()`|共通テーブル式（CTE）を追加する|
|`withRecursive()`|再帰CTEを追加する|
|`transaction()`|トランザクションを開始する|
|`schema`|テーブルやインデックスなどを操作する|
|`destroy()`|接続プールを破棄する|

### SELECTと絞り込み

|API|説明|
|:--|:--|
|`select()`|取得するカラムや式を指定する|
|`selectAll()`|すべてのカラムを取得する|
|`distinct()`|重複する行を除く|
|`where()`|条件を追加する|
|`whereRef()`|カラム同士を比較する|
|`having()`|集計後の条件を追加する|
|`groupBy()`|グループ化する|
|`orderBy()`|並び順を指定する|
|`limit()`|取得件数の上限を指定する|
|`offset()`|取得を始める位置を指定する|

### JOINと集合演算

|API|説明|
|:--|:--|
|`innerJoin()`|内部結合する|
|`leftJoin()`|左外部結合する|
|`rightJoin()`|右外部結合する|
|`fullJoin()`|完全外部結合する|
|`union()`|結果を結合して重複を除く|
|`unionAll()`|結果を結合して重複を残す|
|`intersect()`|両方に含まれる結果を取得する|
|`except()`|片方だけに含まれる結果を取得する|

利用できるJOINや集合演算はデータベースによって異なります。

### INSERT・UPDATE・DELETE

|API|説明|
|:--|:--|
|`values()`|追加する値を指定する|
|`set()`|更新する値を指定する|
|`returning()`|変更した行から返すカラムを指定する|
|`returningAll()`|変更した行の全カラムを返す|
|`onConflict()`|INSERT時の競合処理を指定する|

`returning()` や `onConflict()` の対応状況はデータベースによって異なります。

### 実行と確認

|API|説明|
|:--|:--|
|`execute()`|クエリを実行して結果を配列で返す|
|`executeTakeFirst()`|先頭の結果を返す。0件なら `undefined`|
|`executeTakeFirstOrThrow()`|先頭の結果を返す。0件なら例外|
|`compile()`|実行せず、SQLとパラメータへ変換する|
|`explain()`|実行計画を取得する|

`compile()` を使うと、生成されたSQLを確認できます。

```typescript
const query = db
  .selectFrom('user')
  .select(['id', 'name'])
  .where('id', '=', 1)

console.log(query.compile())
```

PostgreSQLでは、SQLとパラメータが次のような形で得られます。

```text
{
  sql: 'select "id", "name" from "user" where "id" = $1',
  parameters: [1]
}
```

### 型

|API|説明|
|:--|:--|
|`Generated<T>`|データベースが生成し、INSERT時に省略できるカラムを表す|
|`ColumnType<S, I, U>`|SELECT、INSERT、UPDATEごとの型を指定する|
|`Selectable<T>`|SELECT結果の型を作る|
|`Insertable<T>`|INSERT値の型を作る|
|`Updateable<T>`|UPDATE値の型を作る|
|`sql<T>`|生SQLの式やクエリを書く|

### マイグレーション

|API|説明|
|:--|:--|
|`db.schema`|テーブルやインデックスなどを操作する|
|`FileMigrationProvider`|ディレクトリからマイグレーションを読み込む|
|`Migrator`|マイグレーションを管理する|
|`migrateToLatest()`|未適用のマイグレーションをすべて実行する|
|`migrateUp()`|次のマイグレーションを1つ実行する|
|`migrateDown()`|直前のマイグレーションを1つ戻す|
|`migrateTo()`|指定したマイグレーションまで進めるか戻す|

## おわりに

Kyselyを使うと、SQLに近い書き味を保ちながらTypeScriptの型チェックと補完を使えます。
マイグレーションはSchema APIを基本とし、必要な箇所だけ `sql` タグを使うと扱いやすいです。
まずは普段のCRUDをクエリビルダーで書き、必要な箇所だけ `sql` タグを使ってみてください :relaxed:

## 参考リンク

- https://kysely.dev/docs/getting-started
- https://kysely.dev/docs/migrations
- https://github.com/kysely-org/kysely
- https://kysely-org.github.io/kysely-apidoc/
