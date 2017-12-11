# 07 ? !がついたメソッドを使おう

# !
# - upcase 大文字にする
# - upcase! 破壊的に大文字 対象のオブジェクトが変更される
# - downcase 小文字にする
# - reverse 逆順にする

name = "taguchi"
puts name.upcase # TAGUCHI
puts name # taguchi
puts name.upcase! # TAGUCHI
puts name # TAGUCHI

puts name.downcase # taguchi

puts name.reverse # IHCUGAT

# ?
# - 真偽値 true false
# - empty? オブジェクトが空か判定
# - include?() オブジェクトに含まれるか判定
p name.empty? # false
p name.include?("g") # true
