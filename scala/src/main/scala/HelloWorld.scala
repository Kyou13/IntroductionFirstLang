import scala.collection.mutable.{Map => MutableMap}
object HelloWorld {
  def mult = (a: Int)=>((b: Int)=>a*b)
  def mult2 = (_: Int)*(_ : Int)
  def msg(from: String, to: String, text: String)= s"($from -> $to): $text"
  def swap(a: Int,b: Int) = (b,a)
  def main(args: Array[String]): Unit = {
    val a: String = "aaa"
    val double = mult(2)
    println(double(3))
    print(a+"b")
    val msgtoB = msg(_: String,"hello",_: String)
    println(msgtoB("a","b"))
    val s = swap(1,2)
    println(s._1)
    val seq = List(1,2,3)
    println(seq.head)
    val set1 = Set(1,2,3)
    val set2 = Set(2,3,4)
    println(set1 & set2)
    println(set1 | set2)
    println(set1 &~ set2)
    val mmap = MutableMap("taguchi"->1, "fkoji"->2)
    val map = Map("taguchi"->1, "fkoji"->2)
    println(map.getOrElse("taguch","無いよ"))
    val map2 = map.updated("taguchi",4)
    println(map2)
    println(mult2(1,2))
    println("---")
    seq.map((a: Int)=>a*2).filter(_>3).foreach(println) // 4,6
    val maps = List((1,2),(3,4))
    maps.foreach(_ match {
      case _ => println("HELLO(1,2)")
      case (1,2) => println("Other")
    })
    map.get("hello") match {
      case Some(v) => println(v)
      case None => println("No")
    }
    if (map.contains("hello")){
      println("Hello")
    }
    else {
      println("NotContains")
    }
  }
}
