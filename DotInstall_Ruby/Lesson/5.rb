# 05 数値オブジェクト
# 数値

p 4.8.class # Float
p 4.8.methods # Float Classメソッドが出力

# + - * / % **

p 10 + 3 # 13
p 10 * 3 # 30
p 2.4 * 2 # 4.8
p 10 / 3 # 3
p 10 % 3 # 1
p 10.0 / 3 #3.3333...
p Rational(2, 5) + Rational(3, 4) # 分数 (23/20) 

# 小数点を扱うメソッド
p 52.6.round # 四捨五入 53
p 52.6.floor # 切り捨て 52
p 52.6.ceil # 切り上げ 53
