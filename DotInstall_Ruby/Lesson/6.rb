# 06 文字列オブジェクト
# "" 特殊文字を扱える、式展開
# '' そのまま表示

puts "hell\no worl\td" # \n 改行 \t タブ文字
puts 'hell\no worl\td' # hell\no worl\td 

puts "price #{3000 * 4}" # 式展開する price 12000
puts 'price #{3000 * 4}' # price #{3000 * 4}

name = "taguchi"
puts "hello #{name}" # hello taguchi

# + *
puts "hello " + "world" # + 連結
puts "hello world" * 10 # * 繰り返し hello worldhello world ...
