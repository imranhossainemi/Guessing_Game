require 'openssl'
require 'securerandom'

class KeyGenerator
  def self.generate_key
    SecureRandom.hex(32)
  end
end

class HMACGenerator
  def self.generate_hmac(key, message)
    OpenSSL::HMAC.hexdigest('SHA256', key, message)
  end
end

class GameRules
  attr_reader :moves, :rules

  def initialize(moves)
    @moves = moves
    @rules = generate_rules
  end

  def generate_rules
    num_moves = @moves.length
    rules = Array.new(num_moves)

    for i in 0...num_moves
      rules[i] = Array.new(num_moves)
      half = num_moves / 2

      for j in 0...num_moves
        if i == j
          rules[i][j] = "Draw"
        elsif (j + half) % num_moves == i || (j + half) % num_moves == (i + half) % num_moves
          rules[i][j] = "Win"
        else
          rules[i][j] = "Lose"
        end
      end
    end

    rules
  end

  def get_winner(player_move, computer_move)
    @rules[player_move][computer_move]
  end
end

class HelpTable
  def self.generate_table(moves, rules)
    num_moves = moves.length
    table = Array.new(num_moves + 1) { Array.new(num_moves + 1, '') }

    for i in 0...num_moves
      table[0][i + 1] = moves[i]
      table[i + 1][0] = moves[i]
    end

    for i in 0...num_moves
      for j in 0...num_moves
        table[i + 1][j + 1] = rules[i][j]
      end
    end

    table
  end
end

def print_table(table)
  table.each do |row|
    puts row.join('\t')
  end
end

def print_menu(moves)
  puts "Available moves:"
  moves.each_with_index do |move, index|
    puts "#{index + 1} - #{move}"
  end
  puts "0 - exit"
  puts "? - help"
end

def get_user_input
  $stdin.gets.chomp
end

def play_game(moves)
  key = KeyGenerator.generate_key
  computer_move = rand(moves.length)
  hmac = HMACGenerator.generate_hmac(key, computer_move.to_s)
  game_rules = GameRules.new(moves)

  puts "HMAC: #{hmac}"
  print_menu(moves)
  puts "Enter your move:"

  user_input = get_user_input
  while user_input != '0'
    if user_input == '?'
      help_table = HelpTable.generate_table(moves, game_rules.rules)
      print_table(help_table)
    elsif user_input.to_i < 1 || user_input.to_i > moves.length
      puts "Invalid input. Please enter a valid move or '?' for help."
    else
      player_move = user_input.to_i - 1
      winner = game_rules.get_winner(player_move, computer_move)
      puts "Your move: #{moves[player_move]}"
      puts "Computer move: #{moves[computer_move]}"
      puts "Result: #{winner == "Draw" ? "Draw" : winner == "Win" ? "You win!" : "You lose!"}"
      puts "HMAC key: #{key}"
    end

    puts "\nEnter your move:"
    user_input = get_user_input
  end
end

# Command line arguments are passed as moves
moves = ARGV
if moves.length < 3 || moves.length % 2 == 0 || moves.uniq.length != moves.length
  puts "Error: Incorrect number of moves or duplicate moves."
  puts "Example usage: ruby rock_paper_scissors.rb rock paper scissors"
else
  play_game(moves)
end