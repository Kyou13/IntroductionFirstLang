# 25 ミックスイン
# - 継承関係の無い2つのクラスに共通機能をもたせる場合などに使用

module Debug
  
  def info
    puts "#{self.class} debug info ..."
  end

end

class Player
  include Debug
end

class Monster
  include Debug
end

Player.new.info
Monster.new.info
