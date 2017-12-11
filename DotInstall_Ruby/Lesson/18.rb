# メソッド

def sayHi(name = "tom") # name:引数 tom:default
  # score = 80 # メソッド内で定義した半数のスコープ範囲はメソッド内
  # puts "hi! #{name}"
  return "hi! #{name}"
end

sayHi "taguchi" # sayHi("taguchi") と同じ
sayHi

p sayHi
# p score # error
