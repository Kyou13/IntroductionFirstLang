# 12 書式付きで値を埋め込む
# "文字列" % 値

# %s 文字列
p "name: %s" % "taguchi"
p "name: %10s" % "taguchi" # 10文字分確保
p "name: %-10s" % "taguchi" # 10文字確保し左揃え

# %d %f 数値
# 値が複数の場合は配列で渡す
p "id: %05d, rate: %10.2f" % [355, 3.284] # %05dは5文字に満たない場合0埋め, %10.2fは10文字確保のうち2文字は小数 

# printf 
printf("name: %10s\n", "taguchi")
printf("id: %05d, rate: %10.2f\n" , 355, 1234567.284)

# sprintf 返り値が戻り値
p sprintf("name: %10s\n", "taguchi")
p sprintf("id: %05d, rate: %10.2f\n" , 355, 3.284)
