# 13 if
# 条件記号 
# > < >= <= == !=
# AND:&& OR:|| NOT:!

score = gets.to_i # gets:1行読み込む
p "%dです" % score

if score > 80 then
  puts "great!"
elsif score > 60 # thenは省略可
  puts "good!"
else 
  puts "so so .."
end  


# puts "great!" if score > 80 # ifを後に書くことも可能
