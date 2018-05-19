trait Printable {
  def print() = println("now printing ...")
}

trait sharable {
  def share() = println("now sharing ...")
}

class User extends Printable with sharable
// class User extends OtherClass with Printable

object MyApp {


  def msg(from: String, to: String, text: String) = "%s -> %s : %s".format(from,to,text)

  def div(a: Int, b: Int)[String, Int] = {
    if (b == 0) Left("Zero div error!")
    else Right(a / b)
  }
  def main(args: Array[String]): Unit = {
    val user = new User()
    user.print()
    user.share()
    println("%s".format("Great"))
    val score = 90
    val result =
      if (score > 80) {
        val hello = "Great"
        hello
      } // 複数行にならない場合一行で書くこと可能
      else if (score > 60) "Cool"
      else "so so.."
    println(result)
    println("%06.2f".format(10.0))
    val msgToFkoji = msg(_: String,"fkoji",_: String)
    println(msgToFkoji("saito","hello"))
    var scores_list = List[Int]()
    scores_list = scores_list :+ 300
    println(scores_list)
    div(10,0) match{
      case Right(n) => println(n)
      case Left(s) => println(s)
    }
  }


}
