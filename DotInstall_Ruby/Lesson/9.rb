# 09 ハッシュオブジェクト
# - key / value 

#scores = {"taguchi" => 200, "fkoji" => 400} # key => value
#scores = {:taguchi => 200, :fkoji => 400} # こちらのほうが上より高速に動作
scores = {taguchi: 200, fkoji: 400} # 上の省略形

p scores[:taguchi] # value取得 200
scores[:fkoji] = 600 # value書き換え
p scores # {:taguchi=>200, :fkoji=>600}

# メソッド
p scores.size # 要素の数 2
p scores.keys # 全key取得 [:taguchi, :fkoji]
p scores.values # 全value取得 [200, 600]
p scores.has_key?(:taguchi) # 指定したkeyをもつか true
