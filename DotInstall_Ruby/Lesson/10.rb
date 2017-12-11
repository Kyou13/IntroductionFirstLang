# 10 オブジェクト変換

x = 50
y = "3"

# p x + y # error
p x + y.to_i # toInt 53
p x + y.to_f # toFloat 53.0
p x.to_s + y # toString "503"

scores = {taguchi: 200, fkoji: 400}
p scores.to_a # toArray [[:taguchi, 200], [:fkoji, 400]]
p scores.to_a.to_h # {:taguchi=>200, :fkoji=>400}
