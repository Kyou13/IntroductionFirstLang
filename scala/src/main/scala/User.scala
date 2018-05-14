package com.dotinstall.model

object User{
  def getInfo() = println("UserObject")
  def apply(name: String) = new User(name)
}

class User(val name: String) {
  def sayHi(): Unit = println("Hi!" + name)
}

class AdminUser(name: String, val age: Int) extends User(name){
  def sayHello() = println("Hello!" + name)
}
