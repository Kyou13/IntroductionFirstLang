class User(val name: String = "taguchi"){
  def hello(): Unit = println(s"hello $name")
}
object MyApp {

  def main(args: Array[String]): Unit = {
    val user: User = new User()
    user.hello()
    val helloWorld = 2
    println("oh.."+helloWorld)
  }

}
