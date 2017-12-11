# 23 メソッドのアクセス権
# - public
# - private


class User

  def sayHi # インスタンスメソッド
    puts "hi! i am #{@name}"
    # self.private # privateはレシーバを指定できない
    sayPrivate
  end
  
  private # 同じクラス内からのアクセス可能
  def sayPrivate
    puts "private"
  end

end

# User:親クラス
# AdminUser: 子クラス
class AdminUser < User

  def sayHello
    puts "Hello!"
    sayPrivate # 継承先でも使用可能
  end

  # オーバーライドも出来る
  def sayPrivate
    puts "private from Admin"
  end
  
end

# User.new.sayPrivate # Error
User.new.sayHi
# AdminUser.new.sayHello
AdminUser.new.sayPrivate
