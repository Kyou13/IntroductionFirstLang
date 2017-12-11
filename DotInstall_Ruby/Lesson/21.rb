# 21 クラスメソッド,クラス変数

class User

  @@count = 0 # クラス変数

  VERSION = 1.1 # クラス定数

  def initialize(name)
    @@count += 1
    @name = name # @はインスタンス変数
  end

  def sayHi # インスタンスメソッド
    puts "hi! i am #{@name}"
  end
  
  def self.info # クラスメソッド
    puts "#{VERSION}: User Class, #{@@count} instances."
  end
end

tom = User.new("tom")
bob = User.new("bob")
steve = User.new("steve")
User.info # User Class 3 instances.
p User::VERSION
