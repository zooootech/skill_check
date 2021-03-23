# 東京の下町に長テーブルで有名な老舗うなぎ屋がありました。
# そのうなぎ屋にはとても大きい長テーブルがあり、テーブルの周りにn個の座席が配置されています。
# 座席には、時計回りに1, 2, …, nと番号が振られています。
# 座席はテーブルの周りに配置されているので、座席番号nの座席と1の座席は隣接しています。
# 今、m個のグループの人達が座席に順番に座りに来ます。i番目(1≦i≦m)のグループの人数をa_i人とします。
# 彼らは、長テーブルに並んだ座席の内、ある連続するa_i個の座席に一斉に座ろうとします。
# ただしお客さんは江戸っ子なので、それら座席のうち、いずれか一つでも既に先客に座られている座席があった場合、
# 一人も座らずにグループ全員で怒って帰ってしまいます。江戸っ子は気が早いんでぃ。
# 入力では、i番目のグループが座ろうとする連続した座席の位置は、整数b_iにより指定されます。
# i番目のグループは、座席番号b_iの座席を始点として、そこから時計回りにa_i個分の座席に座ろうとします。
# 最後のグループが座りに来た後、無事に長テーブルの座席に着席出来ている人数を出力するプログラムを作成してください。


# 入力される値
# 入力はm+1行から成ります。
# 1行目にはn(座席数)とm(グループ数)が半角スペース区切りで入力されます。
# i+1行目(1≦i≦m)には2個の整数a_i(グループの人数)とb_i(着席開始座席番号)が半角スペース区切りで入力されます。
# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。


# 期待する出力
# 最後のグループが座りに来た後、無事に座席に着席出来ている人数を1行で出力してください。


# 条件
# すべてのテストケースにおいて、入力される値は以下の条件を満たします。

# 1 ≦ n ≦ 100
# 1 ≦ m ≦ 100
# 1 ≦ a_i ≦ n
# 1 ≦ b_i ≦ n


# 入力例1
# 6 3
# 3 2
# 1 6
# 2 5

# 出力例1
# 4

# 入力例2
# 12 6
# 4 6
# 4 8
# 4 10
# 4 12
# 4 2
# 4 4

# 出力例2
# 12


line = gets.chomp.split(" ")
num = line[0].to_i

# 範囲オブジェクトを利用し、1からnumまでの連続した値を要素にもつ配列を生成
seats = [*1..num]  # (1..num).to_a でも可

group = line[1].to_i
array = []
for i in 1..group
  line = gets.chomp.split(" ")
  line.map! { |n| n.to_i }
  array.push(line)
end

group.times do |i|
  reserved_seat = [*array[i][1]..(array[i][1] + array[i][0] - 1)]
  reserved_seat.map.with_index do |n, idx|
    while n > num
      n = n % num
    end
    reserved_seat[idx] = n
  end
  if (seats - reserved_seat).length == (seats.length - reserved_seat.length)
    seats.delete_if do |seat|
      reserved_seat.include?(seat)
    end
  end
end

puts num - seats.length

# -------------------------------------------------

a = []
b = []

n, m = gets.split.map(&:to_i)
m.times { |i| a[i], b[i] = gets.split.map(&:to_i) }

table = [0] * n

m.times do |i|
  head = b[i] - 1
  tail = a[i] + b[i] - 2

  range = (head..tail).map { |j| j % n }
  range.each { |j| table[j] = 1 } if range.sum { |j| table[j] }.zero?
end

puts table.sum





  seats - array[i][1] + (array[i][0] - 1)