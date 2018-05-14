object MyApp {

  def main(args: Array[String]): Unit = {
    // match
    val signal = "pink"
    val result = signal match {
      case "red" => "stop"
      case "blue" | "green" => "go"
      case "yellow" => "caution"
      // case _ => "wrong signal"
      case other => s"wrong signal: $other"
    }
    println(result)
  }

}
