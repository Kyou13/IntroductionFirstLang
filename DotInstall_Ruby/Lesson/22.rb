# 22 クラス継承

class User


  def initialize(name)
    @name = name # @はインスタンス変数
  end

  def sayHi # インスタンスメソッド
    puts "hi! i am #{@name}"
  end
  
end

# User:親クラス
# AdminUser: 子クラス
class AdminUser < User

  def sayHello
    puts "Hello from #{@name}"
  end
  
# オーバーライド
  def sayHi # インスタンスメソッド
    puts "hi! from Admin"
  end

end

tom = AdminUser.new("tom")
tom.sayHi
tom.sayHello
