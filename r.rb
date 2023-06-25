# じゃんけんの手を表す定数
ROCK = 1
PAPER = 2
SCISSORS = 3
QUIT = 4

# 手を文字列に変換するヘルパー関数
def hand_to_string(hand)
  case hand
  when ROCK
    'グー'
  when PAPER
    'パー'
  when SCISSORS
    'チョキ'
  end
end

# あっち向いてホイの方向を表す定数
UP = 1
DOWN = 2
LEFT = 3
RIGHT = 4

# あっち向いてホイの方向を文字列に変換するヘルパー関数
def direction_to_string(direction)
  case direction
  when UP
    '上'
  when DOWN
    '下'
  when LEFT
    '左'
  when RIGHT
    '右'
  end
end

# プレイヤーの手を入力する関数
def input_player_hand
  puts 'じゃんけんの手を選んでください:'
  puts '1. グー'
  puts '2. パー'
  puts '3. チョキ'
  puts '4. 終了'
  print '選択: '
  choice = gets.chomp.to_i

  # 入力値のバリデーション
  until [ROCK, PAPER, SCISSORS, QUIT].include?(choice)
    puts '無効な選択です。再度入力してください。'
    print '選択: '
    choice = gets.chomp.to_i
  end

  choice
end

# 相手プレーヤーの手をランダムに選ぶ関数
def choose_opponent_hand
  [ROCK, PAPER, SCISSORS].sample
end

# あっち向いてホイの方向を入力する関数
def determine_ahchi_direction
  puts 'あっち向いてホイ！'
  puts '1. 上'
  puts '2. 下'
  puts '3. 左'
  puts '4. 右'
  print '選択: '
  choice = gets.chomp.to_i

  # 入力値のバリデーション
  until [UP, DOWN, LEFT, RIGHT].include?(choice)
    puts '無効な選択です。再度入力してください。'
    print '選択: '
    choice = gets.chomp.to_i
  end

  choice
end

# メインの処理
loop do
  puts 'じゃんけんスタート！'
  player_hand = input_player_hand

  break if player_hand == QUIT

  opponent_hand = choose_opponent_hand

  puts "プレーヤーの手: #{hand_to_string(player_hand)}"
  puts "相手の手: #{hand_to_string(opponent_hand)}"

  if player_hand == opponent_hand
    puts '結果: あいこでしょ！'
  else
    winner = (player_hand == ROCK && opponent_hand == SCISSORS) ||
             (player_hand == PAPER && opponent_hand == ROCK) ||
             (player_hand == SCISSORS && opponent_hand == PAPER) ? 'プレーヤー' : '相手'
    puts "じゃんけんの結果: #{winner}の勝ち"

    if winner == 'プレーヤー'
      player_direction = determine_ahchi_direction
      opponent_direction = [UP, DOWN, LEFT, RIGHT].sample
    else
      opponent_direction = [UP, DOWN, LEFT, RIGHT].sample
      player_direction = determine_ahchi_direction
    end

    puts "プレーヤー: #{direction_to_string(player_direction)}！"
    puts "相手: #{direction_to_string(opponent_direction)}！"

    if player_direction == opponent_direction
      puts "結果: #{winner}の勝ち！"
    else
      puts '結果: 引き分け！'
    end
  end

  # ゲーム終了判定
  puts 'ゲームを続けますか？'
  puts '1. 続ける'
  puts '2. 終了する'
  print '選択: '
  choice = gets.chomp.to_i

  until [1, 2].include?(choice)
    puts '無効な選択です。再度入力してください。'
    print '選択: '
    choice = gets.chomp.to_i
  end

  break if choice == 2
end

puts 'じゃんけんを終了します。'
