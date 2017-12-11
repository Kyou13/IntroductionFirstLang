# 14 case

single = gets.chomp # gets:改行コードを取り除く

case single
when "red"
  puts "stop!"
when "green", "blue" # 複数指定することも可能
  puts "go!"
when "yellow"
  puts "caution!"
else
  puts "wrong signal"
end

