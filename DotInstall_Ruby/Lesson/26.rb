# 26 例外処理

class MyError < StandardError; end

x = gets.to_i

begin
  if x == 3
    raise MyError
  end
  p 100 / x # 0だとError
rescue MyError
  puts "not 3!"
rescue => ex # 例外発生時の処理 発生した例外オブジェクトをexに代入
  p "Message: #{ex.message}"
  p "Class: #{ex.class}"
  puts "stopped!"
ensure # 例外発生に関わらず行う処理
  puts "-- END --"
end
