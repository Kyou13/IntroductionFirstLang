trait Printable {
  def print() = println("now printing ...")
}

trait sharable {
  def share() = println("now sharing ...")
}

class User extends Printable with sharable
// class User extends OtherClass with Printable

object MyApp {

  def main(args: Array[String]): Unit = {
    val user = new User()
    user.print()
    user.share()
  }

}
