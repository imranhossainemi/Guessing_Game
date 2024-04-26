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

    (0...num_moves).each do |i|
      rules[i] = Array.new(num_moves)
      half = num_moves / 2

      (0...num_moves).each do |j|
        rules[i][j] = if i == j
                        'Draw'
                      elsif (j + half) % num_moves == i || (j + half) % num_moves == (i + half) % num_moves
                        'Win'
                      else
                        'Lose'
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
    table = Array.new(num_moves + 1) { Array.new(num_moves + 1, 'PC\User') }

    (0...num_moves).each do |i|
      table[0][i + 1] = moves[i]
      table[i + 1][0] = moves[i]

      (0...num_moves).each do |j|
        table[i + 1][j + 1] = rules[i][j]
      end
    end

    table
  end
end

def print_table(table)
  table.each do |row|
    puts row.join(' ')
  end
end

def print_menu(moves)
  puts 'Available moves:'
  moves.each_with_index do |move, index|
    puts "#{index + 1} - #{move}"
  end
  puts '0 - exit'
  puts '? - help'
end

def users_input
  $stdin.gets.chomp
end

def print_hmac_and_menu(moves, hmac)
  puts "HMAC: #{hmac}"
  print_menu(moves)
  puts 'Enter your move:'
end

def handle_user_input(user_input, moves, game_rules, computer_move, key)
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
  puts "Result: #{if winner == 'Draw'
                    'Draw'
                  else
                    winner == 'Win' ? 'You win!' : 'You lose!'
                  end}"
  puts "HMAC key: #{key}"
end

puts "\nEnter your move:"
end

def play_game(moves)
  key = KeyGenerator.generate_key
  computer_move = rand(moves.length)
  hmac = HMACGenerator.generate_hmac(key, computer_move.to_s)
  game_rules = GameRules.new(moves)

  print_hmac_and_menu(moves, hmac)

  user_input = users_input
  while user_input != '0'
    handle_user_input(user_input, moves, game_rules, computer_move, key)
    user_input = users_input
  end
end

moves = ARGV
if moves.length < 3 || moves.length.even? || moves.uniq.length != moves.length
  puts 'Error: Incorrect number of moves or duplicate moves.
  Please provide an odd number of unique moves greater or equal to 3 user input.'
  puts 'Example usage: ruby game.rb rock paper scissors'
else
  play_game(moves)
end
