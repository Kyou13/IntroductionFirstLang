# Scala コップ本 3版

## 共通
`式`は評価した時、結果値がある
## 2章
### 2.2 変数
- val：immutable 再代入不可
- var：mutable 再代入可
```aidl
val msg: String = "hello"
```

### 2.3 関数
- 基本形
  - ブロックの最後が返り値
```aidl
def max(x: Int, y: Int): Int = {
  if(x > y){
    x 
  }  
  else{
    y
  }  
}
```

- 再帰じゃなかったら`結果型`省略可
- 関数の中身1文なら`{}`省略可

- 省略形
```aidl
def max(x: Int, y: Int) = if(x > y) x else y
```

### 2.6 foreach, for
- scalaちゃんはできるだけ`命令型`ではなく`関数型`で書きたいマン
- 基本形
```aidl
args.foreach((arg: String) => println(arg))
// foreachに渡されているのは`関数リテラル`
```

- 関数リテラルが1つの引数をとる1文なら引数を省略できる
- 省略形
```aidl
args.foreach(println)
```

```aidl
for(arg <- args)
  println(arg)
```

- `arg`は`val`

## 3章
### 3.1 配列(Array)
- *ミュータブル*
- 基本形(配列の初期化は別)
```aidl
val greetStrings: Array[String] = new Array[String](3)
greetStrings(0) = "hello" // greetStrings.update(0, "hello")
grretStrings(1) = ","
grretStrings(2) = "world\n"

greesStrings(0) = "HELLO" // 再代入
```
- なんで`val`?
  - valの参照しているオブジェクトの中身は変わる可能性がある
```aidl
for(i <- 0 to 2)
  print(greetStrings(i))
``` 
- `0 to 2`は`(0).to(2)`の省略形 
- **すべての演算がメソッドの呼び出し**  


- 基本形(初期化と定義同時)
```aidl
val numNames = Array("zero", "one", "two")
// Array[String]と推論
```


### 3.2 リスト(List)
- *イミュータブル*
- 関数型の前提：**メソッドは副作用を持ってはならない**
  - 言い換えると**イミュータブルである**
- `Array`との違い  
  - イミュータブル
  
- 基本形(初期化と定義同時,別は出来ない)
```aidl
val oneTwoThree = List(1, 2, 3)
```

- リスト同士連結するのは`:::`メソッド
  - pythonのexpand
- 新しく先頭に要素追加するのは`::`メソッド
  - pythonのinsert
```aidl
val oneTwo = List(1,2)
val threeFour = List(3,4)
val oneTwoThreeFour = oneTwo ::: threeFour
val oneTwoThreee = 3 :: oneTwo
val onewTwoThree = 1 :: 2 :: 3 :: Nil //数珠つなぎ
```
- メソッドの最後が`:`は右被演算子から呼び出される
  - `oneTwo.::(3)`

### 3.3 タプル
- イミュータブル 
- 異なる型の要素もてる()
```aidl
val pair = (99, "hello")
println(pair._1)
```
- 最大22の要素
- 要素番号1〜なの注意

### 3.4 集合(Set)とマップ(Map)
- *イミュータブル*なものと*ミュータブル*なもの存在
```aidl
var jetSet = Set("Boeing", "Airbus") // Setコンパニオンオブジェクトのapplyを呼んでる
jetSet += "Lear"
println(jetSet.contains("Cessna")) //jetSet("Cessna")

```

```aidl
// ミュータブルは以下をimport
import scala.collection.mutable
val jetSet = mutable.Set[String]() 
jetSet += "Boeing"
jetSet += "Airbus"
```
- イミュータブルな場合(`imutable.Set`)の`+=`は本来の意味ではない
  - `jetSet = jetSet + "Lear"`ただ再代入してるだけ
TODO: HASH系とは  

- イミュータブルなものとミュータブルなもの存在
```aidl
val romanNumeral = Map(
  1 -> "I", 2 -> "II"
)
println(romanNumeral(1))

// ミュータブルは以下をimport
import scala.collection.mutable
```

### 3.5 関数型のスタイルを見分ける 
```aidl
def printArgs(args: Array[String]): Unit = {
  var i = 0
  for(i < args.length){
    println(args(i))
    i += 1
  }
}
```
は返却値`Unit`なのに標準出力にしゅつりょくするという副作用を持つ
以下が副作用をもたないように変更したもの
```aidl
def formatArgs(args: Array[String]): Unit = args.mkString("\n")
```

## 4章
- `scala`のデフォルト修飾子は`public`
### 4.3 シングルトンオブジェクト
- 静的メンバーを持てるようにするためのもの
- `class`と大体同じ構成
- シングルトンオブジェクトと同じ名前をもつクラス
  - そのクラスの`コンパニオンオブジェクト`
  - クラスを`コンパニオンクラス`
- 同じ名前を持たない  
  - `スタンドアロンオブジェクト`
  
### 4.4 Scalaアプリケーション  
- Scalaプログラム実行には`main`メソッドをもつ`スタンドアロンオブジェクト`必要
- エントリーポイントになりうる

*考え方*
1. `class`を定義 -> これじゃ静的メンバー持てない!
2. `object`を定義 -> `object.method`でよべるけど、`new`でインスタンス生成出来ないから、値わたせない！
3. `スタンドアロンシングルトンオブジェクト`を定義 -> それぞれ関連づけないと
4. コンパイルしてクラスファイル作成 -> HAPPY

## 6章 関数型スタイルのオブジェクト
### 6.3 オーバーライド
`java.lang.Object`の`toString`メソッドはデバック情報とか出力する
```aidl
class Rational(n: Int, d: Int){
  override def toString = n + "/" + d
}
```
### 6.4 事前条件
```aidl
class Rational(n: Int, d: Int){
  require(d != 0)
}
```
### 6.11 多重定義
```aidl
  def * (that: Rational): Rational =
    new Rational(numer * that.numer, denom * that.denom)
  def * (that: Int) =
    new Rational(numer * that, denom)

```

## 7章
### 7.2 whileループ
- `while`や`do-while`は`Unit型 ()`を返す
  - javaの`void`とは異なる
### 7.3 for式  
- フィルタリング
```aidl
val filesHere = (new java.io.File(".")).listFiles // Array[java.io.File]
for(file <- filesHere if file.getName.endsWith(".scala"))
  println(file)
```

- 入れ子の反復処理
  - `for式`に複数のジェネレーター含められる
```aidl
def fileLines(file: java.io.File) =
  scala.io.Source.fromFile(file).getLines().toList //getLines()はIterator[String]を返す
def grep(pattern: String) =
  for {
    file <- filesHere
    if file.getName.endsWith(".scala")
    line <- fileLines(file)
    trimmed = line.trim // 途中で代入も可能
    if line.trim.matches(pattern)
  } println(file + ": " + trimmed)
grep(".*gcd.*")  
```  

- 新しいコレクションの生成
  - `for <節> yield <本体>`
  
- `break`と`continue`は存在しない  
### 7.5 match式
- `match`が値を返す
- `break`はいらない
```aidl
val friend =
  firstArg match {
    case "salt" => "pepper"
    case _ => "huh?"
  }
```

### 7.7 変数のスコープ
```aidl
val a = 1
val a = 2 //エラー
```

```aidl
val a = 1
{
  val a = 2 // 問題ない 外側の変数をシャドウイング
  {
    println(a) // 2
  }
}
```
## 8章
### 8.2 ローカル関数
- 名前空間を関数名によって汚さない方法
  - `private` *java,scala*共通
  - ローカル関数を使う *scala*
```aidl
def processFile(filename: String, width: Int)= {
  def processLine(line: String) = { // 外側の関数のパラメータにもアクセスできる
    if (line.length > width)
      println(filename + ": " + line.trim)
  }
  val source = Source.fromFile(filename)
  for (line <- source.getLines())
    processLine(line)
}
```  

### 8.3 一人前の存在としての関数
- 関数リテラル
  - 実行時にインスタンス化すると値としての関数に
```aidl
var increase = (x: Int) => x + 1

// 複数文埋め込むことも可能
increase = (x: Int) => {
  println("We")
  println("are")
  println("here!")
  x + 1 // 返される値
}
```  

- `foreach`,`filter`は引数として関数をとり、コレクションの各要素についてその関数を呼び出す

### 8.5 プレースホルダー
- 個別の値として 
```aidl
val f = _ + _ // エラー(型推論出来ないから)
val f = _ + 1 // エラー(型推論出来ないから)
val f = (_: Int) + (_: Int)
someNumbers.filter(_ > 0)
```
- パラメータリスト全体として
```aidl
def funcC1(a: Int, b: Int, c: Int) = a + b + c
val funcC2 = funcC1 _
val funcC2 = funcC1(1, _: Int, 3)
val pripri = println _ 
val pripri = println  // 引数1つのときはプレースホルダーすら書かなくて良い
```
### 8.7 クロージャー
- 自由変数(more)を束縛し、関数リテラルから実行時に作られる値としての関数
  - 変数辞退をつかんでいるため、変更してもキャッチできる
  - 束縛変数は引数として与えられてるような値
```aidl
var more = 10
val addMore = (x: Int) => x + more
```

- 以下の場合はクロージャーが作成されたときにアクティブなmoreを参照
```aidl
def makeIncreaser(more: Int) = (x: Int) => x + more
```

### 8.8 関数呼び出しの特殊な携帯
- `名前付き引数`も`引数のデフォルト値`もある

### 8.9 末尾再帰
再帰を`while`にするイメージ


## 9章
### 9.1 重複するコードの削減
- 束縛変数と自由変数をサポートしているおかげ
```aidl
object FileMatcher{
  private def filesHere = (new java.io.File(".")).listFiles
  private def filesMatching(matcher: String => Boolean) =
    for (file <- filesHere; if matcher(file.getName))
      yield file
  def filesEnding(query: String) =
    filesMatching(_.endsWith(query))   
}
```

### 9.3, 9.4 カリー化
- 新しい制御構造を作るのに必要
- 引数1つのメソッド呼び出しでは中括弧使っていい
  - カリー化使った場合に、見やすい構文になるから
```aidl
def withPrintWriter(file: File)(op: PrintWriter => Unit) = {
  val writer = new PrintWriter(file)
  try {
    op(writer)
  }finally{
    writer.close()
  }
}

val file = new File("data.txt")
withPrintWriter(file){ writer =>
  writer.println(new java.util.Date)
}
```
:
### implicitのひみつ
- 2つの使い方
  - 暗黙の型変換,暗黙のパラメータ
  
- 暗黙の型変換
```
implicit def メソッド名(引数名: 引数の型): 帰り値の型 = 本体
```

例
- IntをBooleanに
```aidl
implicit def intToBoolean(arg: Int): Boolean = arg != 0

if(1)みたいなことできる
```

- 最後に顔文字つける
```aidl
implicit class RichString(val src: String) {
  def smile: String = src + ":-)"
}

// ちなみにこれの省略形
class RichString(val src: String){
  def smile: String = src + ":-)"
}
implicit def enrichiString(arg: String): RichString = new RichString(arg)

"HELLO".smile
```


### エラー処理
エラーを表すデータ型
- *Option*
  - Some, Noneをもつ
    - 値が入ってる時Some, 入っていない時None
```aidl
val o: Option[String] = Option("hoge")
// "hoge"がnullだとNone
```  
  - メソッド get・isEmpty・isDefined
  - 関数を適応するmap
    - 引数に関数リテラル
```aidl
Some(3).map(_ * 3)
```
  - Noneの場合に値を返すfold  
  ```
  n.fold(throw new RuntimeException)(_ * 3)
  ```
  - Option型の入れ子を解消 flatten・flatmap
  ```
  val v1: Option[Int] = Some(3)
  val v2: Option[Int] = Some(5)
  v1.map(i1 => v2.map(i2 => i1 * i2))
  // Option[Option[Int]] = Some(Some(15)) 入れ子になる
  v1.map(i1 => v2.map(i2 => i1 * i2)).flatten // 解消
  // Option[Int] = Some(15)
  v1.flatMap(i1 => v2.map(i2 => i1 * i2))
  // Option[Int] = Some(15)
  ```
- 
### Future
- 非同期処理を行う

