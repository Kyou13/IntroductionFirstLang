# 20 アクセサ
# attr_accessor, attr_reader
#
class User

  attr_accessor :name # setter, getter を定義してくれる
  attr_reader :name # getterのみを定義してくれる

  def initialize(name)
    @name = name # @はインスタンス変数
    sayHi # selfに対する呼び出しのときはメソッドを呼び出す対象のオブジェクト(レシーバ)を省略可
  end

  def sayHi
    # self # メソッドが呼び出されたインスタンスが誰かを常にselfで保持している
    # self.name : @name
    puts "hi! i am #{@name}"
    puts "hi! i am #{self.name}"
    puts "hi! i am #{name}"
  end

end

tom = User.new("Tom") # インスタンス生成
bob = User.new("Bob") # インスタンス生成
p tom
p bob
tom.name = "Tom Jr"
p tom.name
tom.sayHi

