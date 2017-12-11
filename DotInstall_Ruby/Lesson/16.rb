# 16 for, each

# for

# 15 ~ 20 表示される
for i in 15..20 do # do 省略可 p i
  p i
end

# 配列
for color in ["red", "blue"] do # do 省略可
  p color
end

# 辞書
for name, score in {taguchi: 200, fkoji: 400} do # do 省略可
  puts "#{name}: #{score}"
end

# eachメソッド
# -forは内部的にeachメソッドが使用されている

(15..20).each do |i| # do 省略可 p i
  p i
end

# 配列
["red", "blue"].each do |color| # do 省略可
  p color
end

# 辞書
{taguchi: 200, fkoji: 400}.each do |name, score| # do 省略可 # do endを{}で書くことも可能
  puts "#{name}: #{score}"
end
