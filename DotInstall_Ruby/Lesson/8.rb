# 08 配列オブジェクト
# []

colors = ["red", "blue", "yellow"]

p colors[0] # red
p colors[-1] # 末尾 yellow
p colors[0..2] # ["red", "blue", "yellow"]
p colors[0...2] # 末尾手前まで ["red", "blue"]
p colors[5] # nil

# 書き換え
colors[0] = "pink" 
colors[1..2] = ["white", "black"]

# 追加
colors.push("gold")
colors << "silver"
p colors # ["pink", "white", "black", "gold", "silver"]

p colors.size # 配列サイズ 5
p colors.sort # ["black", "gold", "pink", "silver", "white"]
