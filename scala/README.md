# Scala コップ本 3版
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
- ミュータブル
- 基本形(配列の初期化は別)
```aidl
val greetStrings: Array[String] = new Array[String](3)
greetStrings(0) = "hello"
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
- イミュータブル
- 関数型の前提：**メソッドは副作用を持ってはならない**
  - 言い換えると**イミュータブルである**
  
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
- イミュータブルなものとミュータブルなもの存在
```aidl
var jetSet = Set("Boeing", "Airbus")
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
- イミュータブルな場合の`+=`は本来の意味ではない
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
