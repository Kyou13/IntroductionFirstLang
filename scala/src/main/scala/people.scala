package com.dotinstall.abst

trait Common{
  def getInfo()
}
trait Printable extends Common{
  def print() = println("printing...")
  override def getInfo() = println("Print")
}

trait Sharable extends Common{
  def share() = println("sharing...")
  override def getInfo() = println("Share")
}
abstract class User{
  def sayHi()
}

class Japanese[T] extends User with Printable with Sharable {
  def sayHi() = println("こんにちは!")
  def getThree(i: T) = println(s"$i $i $i")
}

