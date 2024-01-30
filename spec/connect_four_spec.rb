# frozen_string_literal: true

require 'rspec'
require_relative '../lib/connect_four'
require_relative 'connect_four_helper'

describe ConnectFour do
  subject(:game) { described_class.new }

  context '#initialize' do
    it 'array should have height of 6' do
      expect(game.array.length).to eql(6)
    end
    it 'array should have width of 7' do
      expect(game.array.all? { |sub_array| sub_array.length == 7 }).to be true
    end
  end

  context "#player_input" do
    it 'change if value is less than 7' do
      len = game.array.length
      i = 1
      expect { game.player_input(i, PLAYER_ONE) }.to change { game.array[len - 1][i - 1] }.to(PLAYER_ONE)
    end

    it "don't change if value is more than 7" do
      len = game.array.length
      i = 8
      expect { game.player_input(i, PLAYER_ONE) }.not_to change { game.array[len - 1][i - 1] }
    end

    it "change the next row if its called again" do
      len = game.array.length
      i = 1
      game.player_input(i, PLAYER_ONE)
      expect { game.player_input(i, PLAYER_ONE) }.to change { game.array[len - 2][i - 1] }.to(PLAYER_ONE)
    end

    it "stop changing when reached it limit" do
      len = game.array.length
      i = 1
      len.times { |_| game.player_input(i, PLAYER_ONE) }
      expect { game.player_input(i, PLAYER_ONE) }.not_to change { game.array }
    end
  end

  context "#check" do
    it "return nil with no input" do
      expect(game.check).to be_nil
    end
    it "return Player 1 as winner" do
      game.array = ConnectFourHelper.testing_check_winner_horizontal
      expect(game.check).to eq(PLAYER_ONE)
    end
    it "return Player 2 as winner" do
      game.array = ConnectFourHelper.testing_check_winner_vertical
      expect(game.check).to eq(PLAYER_TWO)
    end
  end

  context "#check_winner_horizontal" do
    it "return false with no input" do
      expect(game.check_winner_horizontal(0, 0)).to be false
    end

    it "return false with invalid row" do
      expect(game.check_winner_horizontal(10, 0)).to be false
    end
    it "return false with invalid row(less than 0)" do
      expect(game.check_winner_horizontal(-10, 0)).to be false
    end

    it "return false with invalid column" do
      expect(game.check_winner_horizontal(0, 10)).to be false
    end
    it "return false with invalid column(less than 0)" do
      expect(game.check_winner_horizontal(0, -10)).to be false
    end

    it "return true with correct input and row and column" do
      game.array = ConnectFourHelper.testing_check_winner_horizontal

      expect(game.check_winner_horizontal(0, 1)).to be true
    end
    it "return false with correct input and wrong row and column" do
      game.array = ConnectFourHelper.testing_check_winner_horizontal

      expect(game.check_winner_horizontal(0, 0)).to be false
    end
    it "return false with correct input and wrong row and column(Player 1 and Player 2)" do
      game.array = ConnectFourHelper.testing_check_winner_horizontal

      expect(game.check_winner_horizontal(0, 3)).to be false
    end
  end

  context "#check_winner_vertical" do
    it "return false with no input" do
      expect(game.check_winner_vertical(0, 0)).to be false
    end

    it "return false with invalid row" do
      expect(game.check_winner_vertical(10, 0)).to be false
    end
    it "return false with invalid row(less than 0)" do
      expect(game.check_winner_vertical(-10, 0)).to be false
    end

    it "return false with invalid column" do
      expect(game.check_winner_vertical(0, 10)).to be false
    end
    it "return false with invalid column(less than 0)" do
      expect(game.check_winner_vertical(0, -10)).to be false
    end

    it "return true with correct input and row and column" do
      game.array = ConnectFourHelper.testing_check_winner_vertical

      expect(game.check_winner_vertical(2, 6)).to be true
    end
    it "return false with correct input and wrong row and column" do
      game.array = ConnectFourHelper.testing_check_winner_vertical

      expect(game.check_winner_vertical(0, 0)).to be false
    end
    it "return false with correct input and wrong row and column(Player 1 and Player 2)" do
      game.array = ConnectFourHelper.testing_check_winner_vertical

      expect(game.check_winner_vertical(1, 6)).to be false
    end
  end

  context "#check_winner_diagonal_right" do
    it "return false with no input" do
      expect(game.check_winner_diagonal_right(0, 0)).to be false
    end

    it "return false with invalid row" do
      expect(game.check_winner_diagonal_right(10, 0)).to be false
    end
    it "return false with invalid row(less than 0)" do
      expect(game.check_winner_diagonal_right(-10, 0)).to be false
    end

    it "return false with invalid column" do
      expect(game.check_winner_diagonal_right(0, 10)).to be false
    end
    it "return false with invalid column(less than 0)" do
      expect(game.check_winner_diagonal_right(0, -10)).to be false
    end

    it "return true with correct input and row and column" do
      game.array = ConnectFourHelper.testing_check_winner_diagonal_right

      expect(game.check_winner_diagonal_right(1, 3)).to be true
    end
    it "return false with correct input and wrong row and column" do
      game.array = ConnectFourHelper.testing_check_winner_diagonal_right

      expect(game.check_winner_diagonal_right(0, 0)).to be false
    end
    it "return false with correct input and wrong row and column(Player 1 and Player 2)" do
      game.array = ConnectFourHelper.testing_check_winner_diagonal_right

      expect(game.check_winner_diagonal_right(0, 2)).to be false
    end
  end

  context "#check_winner_diagonal_left" do
    it "return false with no input" do
      expect(game.check_winner_diagonal_left(0, 0)).to be false
    end

    it "return false with invalid row" do
      expect(game.check_winner_diagonal_left(10, 0)).to be false
    end
    it "return false with invalid row(less than 0)" do
      expect(game.check_winner_diagonal_left(-10, 0)).to be false
    end

    it "return false with invalid column" do
      expect(game.check_winner_diagonal_left(0, 10)).to be false
    end
    it "return false with invalid column(less than 0)" do
      expect(game.check_winner_diagonal_left(0, -10)).to be false
    end

    it "return true with correct input and row and column" do
      game.array = ConnectFourHelper.testing_check_winner_diagonal_left

      expect(game.check_winner_diagonal_left(0, 4)).to be true
    end
    it "return false with correct input and wrong row and column" do
      game.array = ConnectFourHelper.testing_check_winner_diagonal_left

      expect(game.check_winner_diagonal_left(0, 0)).to be false
    end
    it "return false with correct input and wrong row and column(Player 1 and Player 2)" do
      game.array = ConnectFourHelper.testing_check_winner_diagonal_left

      expect(game.check_winner_diagonal_left(1, 3)).to be false
    end
  end

  context "#game_end" do
    it 'return false at the start' do
      expect(game).not_to be_game_end
    end
    it 'return false when not all cells have a value' do
      game.array = ConnectFourHelper.testing_check_winner_horizontal
      expect(game).not_to be_game_end
    end
    it 'return false when only one column have value' do
      game.array = ConnectFourHelper.testing_game_end_2
      expect(game).not_to be_game_end
    end
    it 'return true when all cells have a value' do
      game.array = ConnectFourHelper.testing_game_end
      expect(game).to be_game_end
    end
  end
end
