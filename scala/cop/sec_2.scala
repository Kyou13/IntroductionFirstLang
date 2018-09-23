// 2章
/*
var i = 0
while(i < args.length){
  if(i != 0){
    print(" ")
  }
  print(args(i))
  i += 1
}
*/

// 関数リテラル：(x: Int, y: Int) => x + y
//args.foreach(arg => println(arg))
//args.foreach((arg: String) => println(arg))
//args.foreach(println) // 関数リテラルが1個の引数のみなら、引数明示的に指定しなくて良い

//for(arg <- args) // <- は in みたいなもん
//  println(arg)

// 3章
//val greetStrings = new Array[String](3)
//val greetStrings :Array[String] = new Array[String](3)
//print(args)
// println(1.+(2))
// println(1)
// 演算子じゃなくてメソッド
// var hello = Array(1,2,3)
// Arrayはmutable
// val oneTwoThree = List(1,2,3)
//val oneTwoThree = 1 :: 2 :: 3 :: Nil
//println(oneTwoThree)
//val oneTwo = List(1, 2)
//val threeFour = List(3, 4)
//println(oneTwo :: threeFour) // 一つの要素としてついか
//// println(threeFour.:: (oneTwo))
//println(oneTwo ::: threeFour) // List同士連結
// immutable
var Normal = Map(1 -> "I", 2 -> "II")
println(Normal)
