# frozen_string_literal: true
require_relative 'connect_four'

# TODO: ADD SOME CONNECT 4 EXPLANATION/INTRO
connect_four_game = ConnectFour.new

puts "CONNECT FOUR GAME"
puts "Welcome to Connect 4, a classic strategy game where two players take turns dropping colored discs into a vertical grid. The goal? Connect four of your discs in a row, either horizontally, vertically, or diagonally, before your opponent does. Ready for a challenge of wit and tactics?"
puts "\n", connect_four_game, "\n"

loop do
  players = [PLAYER_ONE, PLAYER_TWO]

  players.each do |player|
    player_input = 0
    loop do
      print "#{player} (column number from 1 to 7): "
      player_input = gets.chomp.to_i
      break if player_input.between?(1, 7)
      puts "Invalid input. Please enter a number between 1 and 7. Try again!!!"
    end

    connect_four_game.player_input(player_input, player)

    puts "\n", connect_four_game, "\n"

    # Check for winner
    result = connect_four_game.check
    puts "#{result} Wins!!!!!" unless result.nil?
    puts "DRAW" if connect_four_game.game_end?
    exit if connect_four_game.game_end? or !result.nil?
  end
end
