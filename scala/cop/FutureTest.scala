import scala.concurrent.{Await, Future}
import scala.concurrent.ExecutionContext.Implicits.global
import scala.concurrent.duration._
import scala.language.postfixOps

object FutureTest{
  def main(args: Array[String]){
    val f1: Future[Int] = Future{
      Thread.sleep(1000)
      println(s"[ThreadName] In f1 Future: ${Thread.currentThread.getName}")
      println(1)
      2
    }

    println(f1.isCompleted)

    val f2: Future[Int] = Future{
      Thread.sleep(1000)
      println(s"[ThreadName] In f2 Future: ${Thread.currentThread.getName}")
      throw new RuntimeException("Failure")
    }

    f1.foreach {case s: Int => 

      println(s"[ThreadName] In Future: ${Thread.currentThread.getName}")
      println(s)
    } // 関数を受け取るメソッドはmatch省略可能

    println(f2.isCompleted)
    f2.failed.foreach {case e: Throwable =>

      println(s"[ThreadName] In Future: ${Thread.currentThread.getName}")
      println(e.getMessage)
    } 
    val f3: Future[Int] = Future{
      Thread.sleep(5000)
      println(s"[ThreadName] In f3 Future: ${Thread.currentThread.getName}")
      7
    }

    val hello = for{
      first <- f1
      second <- f3
    } yield(first,second)
    
    Thread.sleep(2000)
    println(hello.isCompleted)
    println("HHHHH")
    println(f2)
    println("HHHHH")

    Thread.sleep(5000)

    println("HHHHH")
    println(hello)
    println("HHHHH")
    println(s"[ThreadName] In Future: ${Thread.currentThread.getName}")
    println("FINISH")

    // val hello: Future[Int] = Await.ready(f1, Duration.Inf)
  }
}
