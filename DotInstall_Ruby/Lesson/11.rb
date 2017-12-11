# 11 %表記
# -文中で"や'をつかう時に見やすくなる

# ""
puts "hello"

puts %Q(hello)
puts %(hello) # Qは省略可

# ''
puts 'hello'
puts %q(hello)

# 配列
# ""
p ["red", "blue"]
p %W(red blue)

# ''
p ['red', 'blue']
p %w(red blue)
