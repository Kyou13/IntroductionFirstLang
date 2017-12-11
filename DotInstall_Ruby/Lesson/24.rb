# 24 モジュールで名前空間
# - 同名のメソッドなどの衝突を避けることが出来る
# - 同様の機能をまとめる

def movie_encode
end

def movie_export
end

module Movie # 1文字目は大文字

  VERSION = 1.1

  def self.encode
    puts "encoding..."
  end

  def self.export
    puts "exporting..."
  end

end

Movie.encode
Movie.export
p Movie::VERSION
