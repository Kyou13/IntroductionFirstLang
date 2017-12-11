 # 15 while,times

i = 0
# while

# 0 ~ 9
while i < 10 do # do 省略可 
  puts "#{i}: hello"
  i += 1 # i = i+1
end 

# times
# - 回数が決まってる場合使用 

10.times do |i| # ||内の変数で回数管理できる # doは省略可
  puts "#{i}: hello"
end

10.times {|i| puts "#{i}: hello"} # do end を {}で書くことも可能
