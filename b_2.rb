# あなたは、とあるウェブサイトを管理していました。
# ある連続したk日間、このウェブサイトでキャンペーンを行ったのですが、いつからいつまでの期間に行ったかを忘れてしまいました。
# 幸い、ウェブサイトを運営していた全n日分のアクセスログが残っており、1日ごとの訪問者数が分かっています。
# とりあえず、連続するk日の中で、1日あたりの平均訪問者数が最も多い期間を、キャンペーンを行った期間の候補だと考えることにしました。
# n日分の訪問者数のリストとキャンペーンの日数kが入力されるので、キャンペーンを行った期間の候補数と、候補の中で最も早い開始日を出力してください。


# 入力される値
# 入力は2行から成ります。
# 1行目にはnとkが半角スペース区切りで入力されます。
# 2行目にはn個の整数a_1, a_2, …, a_nが半角スペース区切りで入力されます。a_iはi日目の訪問者数を表します。

# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。


# 期待する出力
# キャンペーンを行った期間の候補数と、候補の中で最も早い開始日を、この順で半角スペース区切りで1行で出力してください。


# 条件
# すべてのテストケースにおいて、以下の条件をみたします。

# ・1≦n≦1,000
# ・1≦k≦n
# ・0≦a_i≦100


# 入力例1
# 5 3
# 1 2 3 2 1

# 出力例1
# 1 2

# 入力例2
# 10 2
# 6 2 0 7 1 3 5 3 2 6

# 出力例2
# 5 1

# -------------------------------------------------

# 全日分とキャンペーン期間の取得
# ここで、キャンペーン期間 k は、後で候補者数の平均値を出すときに割る値として用いるので、 to_f で取得します
n, k = gets.chomp.split.map(&:to_f)

# 全日分の訪問者数を取得
log = gets.chomp.split.map(&:to_i)

# n 日分の内、k 日分の期間の候補者数の最大平均値を代入する変数を定義
max_average = 0

# 最大平均値となる期間の回数（キャンペーンを行った期間の候補数）を代入する変数を定義
count = 0

# キャンペーンを行った期間の候補の中で最も早い開始日を代入する変数を定義
start_date = 0

# 全日分の訪問者数の配列から、要素を切り取る際の開始のインデックスを示す変数を定義
i = 0
while true
  # 配列の i 番目から k 個分の要素を slice したものを変数に代入
  # 配列 k_log は、n 日分の内のどこかの k 日分の候補者数を示している
  k_log = log.slice(i, k)

  # 上記で生成した配列の要素の数が k にならない場合、繰り返し処理を抜ける
  # 繰り返し処理で配列をスライスしていき、残っている要素数が k 未満になったとき、繰り返し処理を抜けるようにする
  break if k_log.length != k

  # ある期間の候補者数の合計を変数に代入
  k_sum = k_log.sum

  # ある期間の候補者数の合計 k_sum を k で割った値が、その時点での最大平均値 max_average より大きければ、max_average に k_sum を代入し、count を 1 にし、start_date に i + 1 を代入
  if max_average < (k_sum / k)
    max_average = (k_sum / k)
    count = 1
    start_date = i + 1
  
  # ある期間の候補者数の平均値が、その時点での最大平均値と等しければ、count を 1 プラスする
  elsif max_average == (k_sum / k)
    count += 1
  end

  # 配列から切り取る要素を右にずらすため、i に 1 をプラスする
  i += 1
end

puts "#{count} #{start_date}"

# -------------------------------------------------

# 全日分とキャンペーン期間の取得
all_days_part, campaign_period = gets.chomp.split(" ").map(&:to_f)

# 二行目の全日分の訪問者数を取得する
visitor_numbers = gets.chomp.split(" ").map(&:to_i)

#キャンペーンを行った期間の候補をいれるための空配列の作成
campaign_candidates = []

# 全日分の訪問者数をキャンペーン期間でループさせ、取得した値を空配列にいれる
# each_cons(n)は、selfの中から連続する n 個の要素を 1 つずつずらしながら取得できる
visitor_numbers.each_cons(campaign_period).map { |candidate| campaign_candidates << candidate.sum }

#  キャンペーンの各区間の平均値
averages = []

campaign_candidates.each do |average| 
  averages << (average / campaign_period) 
end 

# キャンペーンの期間での最大値を求める
ans_max = 0 
averages.each do |i|
  if ans_max < i
    ans_max = i
  end
end 

# キャンペーン期間候補の最初に出てくる日を探す
ans_first_max = 0
averages.each do |i|
  if i == ans_max
    break
  else 
    ans_first_max += 1
  end   
end

# 最大値と同じ値の個数を求める
ans_count = 0
averages.each do |i|
  if ans_max == i 
    ans_count += 1
  end 
end 

#キャンペーンを行った期間の候補数と、候補の中で最も早い開始日

puts "#{ans_count} #{ans_first_max + 1}" 

# -------------------------------------------------

# 全日分とキャンペーン期間の取得
n, k = gets.chomp.split.map(&:to_i)

# 全日分の訪問者数を取得
log = gets.chomp.split.map(&:to_i)

# n 日分の内、k 日分の期間の候補者数の最大値を代入する変数を定義
max_average = 0

# 最大平均値となる期間の回数（キャンペーンを行った期間の候補数）を代入する変数を定義
count = 0

# キャンペーンを行った期間の候補の中で最も早い開始日を代入する変数を定義
start_date = 0

# 最初の区間の繰り返し処理と、その時点での「キャンペーンを行った期間の候補数」と「キャンペーンを行った期間の候補の中で最も早い開始日」を 1 にする
for i in 0..(k - 1)
  max_average += log[i]
end
count = 1
start_date = 1

# ある区間での候補者数の合計を tmp という変数を定義し、最初の区間の合計値を代入
tmp = max_average
# それ以降の区間の繰り返し処理
# (n - k + 1) は、最初から最後までの区間における最大値を求める為の処理の回数を示しており、既に最初の区間についての処理は行っているので -1 をしている
for i in 1..((n - k + 1) - 1)
  # それまでの区間の合計値 tmp から、区間から除かれた要素 log[i - 1] を引き、新しく区間に入った要素 log[i + k - 1] を足して、新しい区間の合計値を求め、自己代入する
  tmp = tmp - log[i - 1] + log[i + k - 1]
  if max_average < tmp
    max_average = tmp
    count = 1
    start_date = i + 1
  elsif max_average == tmp
    count += 1
  end
end

puts "#{count} #{start_date}"