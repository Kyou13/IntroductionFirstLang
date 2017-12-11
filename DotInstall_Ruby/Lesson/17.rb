# 17 loop, break, next

# loop
#i = 0
#loop do
#  p i
#  i += 1
#end

10.times do |i|
  if i == 7 then
    # break # 0 ~ 6
    next # 0 ~ 6, 8, 9
  end
  p i
end
