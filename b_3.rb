# 公園には花壇があります。
# 現状のままでは間違えて花壇の内側に入ってしまう人が多いため、ロープで分けることにしました。
# 地図の区画の一辺の長さと同じ長さのロープが十分な量あります。
# 花壇とその他の部分を表す地図が与えられるので、花壇を過不足なく囲うために必要なロープの本数を数えるプログラムを作成してください。
# 入力例 1 では、花壇が隣り合う部分にはロープを使用しないため、14 本のロープで囲うことができます。


# 入力される値
# 入力は以下のフォーマットで与えられます。

# H W
# s_1
# s_2
# ...
# s_H
# ・1 行目に地図の縦幅を表す整数 H と横幅を表す整数 W がこの順で半角スペース区切りで与えられます。
# ・続く H 行のうちの i 行目 (1 ≦ i ≦ H) には半角記号 "#" および "." からなる長さ W の文字列 s_i が与えられます。
# 　s_i の j 番目 (1 ≦ j ≦ W) の文字は地図における i 行 j 列目の区画の地面の様子を表し、"#" は花壇を、"." はその他の部分を表します。
# ・入力は合計で H + 1 行となり、入力値最終行の末尾に改行が 1 つ入ります。

# それぞれの値は文字列で標準入力から渡されます。


# 期待する出力
# 花壇を過不足なく囲うのに必要なロープの本数を整数で出力してください。
# 末尾に改行を入れ、余計な文字、空行を含んではいけません。


# 条件
# すべてのテストケースにおいて、以下の条件をみたします。

# ・1 ≦ H, W ≦ 50
# ・s_i (1 ≦ i ≦ H) は "#", "." で構成される文字列


# 入力例1
# 4 4
# ..#.
# ..#.
# ###.
# ..#.

# 出力例1
# 14

# 入力例2
# 4 4
# .##.
# .##.
# .##.
# .##.

# 出力例2
# 12

# 入力例3
# 3 5
# ...#.
# ##..#
# .##..

# 出力例3
# 18

# -------------------------------------------------

# 繰り返し処理をする中で、指定の区画が花壇の場合、必要となるロープの本数を4プラスした後、もし隣り合う区画が花壇の場合は、その区画の数だけロープの本数を2本ずつ減らす。
# 繰り返し処理は、地図の左上の区画からスタートし、同じ段の中で行数の数だけ右に向かって検証し、右端までいったところで、次の段の左端からまた処理を行う。
# 左上の区画については、そこが花壇かどうかだけを検証し、
# 1段目の区画はその区画の左隣が花壇かどうかを、1行目の区画はその区画の1段上が花壇かどうかを、
# 1段目1行目以外の区画に関しては、その区画の1段上と1行左の区画が花壇かどうかを検証する。

h, w = gets.chomp.split.map(&:to_i)

array = []

for i in 1..h
  array << gets.chomp
end

count = 0  # 必要となるロープの本数を定義

for i in 0..(h - 1)
  for j in 0..(w - 1)
    # 左上の区画かつ、それが花壇の場合
    if i == 0 && j == 0 && array[i][j] == "#"
      count += 4
    # 1段目の区画かつ、それが花壇の場合
    elsif i == 0 && array[i][j] == "#"
      count += 4
      # その区画の左隣が花壇の場合
      if array[i][j - 1] == "#"
        count -= 2
      end
    # 2段目以降の左端の区画かつ、それが花壇の場合
    elsif j == 0 && array[i][j] == "#"
      count += 4
      # その区画の1段上が花壇の場合
      if array[i - 1][j] == "#"
        count -= 2
      end
    # 2段目2行目以降の区画が花壇の場合
    elsif array[i][j] == "#"
      count += 4
      # その区画の1段上が花壇の場合
      if array[i - 1][j] == "#"
        count -= 2
      end
      # その区画の左隣が花壇の場合
      if array[i][j - 1] == "#"
        count -= 2
      end
    end
  end
end