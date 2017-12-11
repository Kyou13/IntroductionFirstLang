# 19 クラス

class User

  def initialize(name)
    @name = name # @はインスタンス変数
  end

  def sayHi # インスタンスメソッド
    puts "hi! i am #{@name}"
  end

end

tom = User.new("Tom") # インスタンス生成
tom.sayHi

tom = User.new("Bob") # インスタンス生成
tom.sayHi
