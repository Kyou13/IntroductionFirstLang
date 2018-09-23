class Cell[A](var value: A){
  def put(newValue: A): Unit ={
    value = newValue
  }
  def get(): A = value
}

class Pair[A, B](val a: A, val b: B){
  override def toString(): String = "(" + a + "," + b + ")"
}
