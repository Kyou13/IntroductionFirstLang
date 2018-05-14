# Scalaのお勉強

- Scalaのメリット
    - オブジェクト指向と関数型の融合
    - JVM上で動作するので、Javaと互換性有る
    
- sbt    
    - ビルドツール
    
---    

- 変数
    - val: 値の再代入不可能
    - var: 値の再代入可能
    
    ```
    val <変数名>: <型> = <値>
    // 型推論により型は省略可
    // Long,Floatは<値>Lなどの表現も可
    ```
    
- 文字列展開
    - s補完子
        - 変数を埋め込む時
    ```aidl
    val name = "yamada"
    prinln(s"name: $name") // name: yamada
    // 式を与えることも可
    println(s"20 + 5 = ${20 + 5}") //20 + 5 = 25
    ```
    - f補完子
        - フォーマット指定子を使う時
    ```aidl
    val name = "yamada"
    val height = 1.9    
    println(f"$name%s is $height%2.2f") // yamada is 1.90  
    // %-2.2fにすると左揃え(デフォは右揃え)
    - その他
    println("hello"+"mother") //hellomother
    println("hello"+123) // hello123
    println("hello" + name) // 結局変数もこう書ける
    ```    
    
- if文    
    - 値を返す式になっている
    ```aidl
    val score = 90
    val result =
      if (score > 80) "Great" // 複数行にならない場合一行で書くこと可能
      else if (score > 60) "Great"
      else "so so.."
    println(result) // Great
    ```
    
- match文
    - switch文のこと    
    ```aidl
    val signal = "red"
    val result = signal match{
      case "red" => "stop"
      case "blue" | "green" => "go" 
      case "yellow" => "caution"
      case _ => "wrong signal" //その他
      // その他の場合に値を受けることも可能
      case other => s"wrong signal: ${other}"
    }
    println(result) // red
    ```
    
- while,do while文    
    ```aidl
    while(..){
    ...
    }
    
    do{
       
    } while(..)
  
    ```
    
- for文    
    - for(ジェネレータ) 式
    - yieldで値を返す
    - toは値を含む,untilは含まない
    ```aidl
    for (i <- 0 to 3) println(i)  // 0 1 2 3
    // ジェネレータは複数可能
    for (i <- 0 to 3; j <- 0 to 3) println(s"$i, $j") // 0, 0  0, 1...
    // 条件を書くことも可能 
    for (i <- 0 to 3; j <- 0 to 3 if i != j ) println(s"$i, $j") // 0, 1  0, 2...
    // 値を返す yield
    val result = for (i <- 0 to 3; j <- 0 to 3 if i != j ) yield s"$i, $j"
    for(el <- result) println(el.getClass)
    ```
    
- method    
    - def <メソッド名>: <型> = <式>
    - 最後に評価された値を返す
    - 例:引数がない場合
    ```aidl
    def sayHi(): String = { // 返り値がない場合はUnit
      "hi!" // return "hi!"と同等
    
    def main: Unit = {
      println(sayHi) // hi!
    }
    ```
    - 例:引数ある場合
    ```aidl
    def sayHi(name: String="taguchi", age: Int=23): Unit = { // defaultの値を設定できる
      println(s"hi!" $name, age $age) // return "hi!"と同等
    
    def main: Unit = {
      sayHi("bob", 35) // hi! bob, age 35
      sayHi() // hi taguchi, age 23
      sayHi(age=18, name="steave") // hi steave, age 18
    }
    ```
    
- Class
    - 変数/フィールドとメソッドをもつ
    ```aidl
    class User{
    ...
    }
    
    object MyApp{
      def main() = {
          val user: User = new User()
    }
    ```
    
    - コンストラクタ引数をもつ場合
    class User(val name: String){ // コンストラクタ引数をそのままフィールドにしている
        // val name = _name
        def sayHello() = println(s"Hi!" + this.name) // thisは省略可能
    } 