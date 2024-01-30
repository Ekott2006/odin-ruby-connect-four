# frozen_string_literal: true

class ConnectFourHelper
  def self.testing_check_winner_horizontal
    [
      [nil, PLAYER_ONE, PLAYER_ONE, PLAYER_ONE, PLAYER_ONE, PLAYER_TWO, PLAYER_TWO],
      [nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil],
    ]
  end

  def self.testing_check_winner_vertical
    [
      [nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, PLAYER_ONE],
      [nil, nil, nil, nil, nil, nil, PLAYER_TWO],
      [nil, nil, nil, nil, nil, nil, PLAYER_TWO],
      [nil, nil, nil, nil, nil, nil, PLAYER_TWO],
      [nil, nil, nil, nil, nil, nil, PLAYER_TWO],
    ]
  end

  def self.testing_check_winner_diagonal_right
    [
      [nil, nil, PLAYER_ONE, nil, nil, nil, nil],
      [nil, nil, nil, PLAYER_TWO, nil, nil, nil],
      [nil, nil, nil, nil, PLAYER_TWO, nil, nil],
      [nil, nil, nil, nil, nil, PLAYER_TWO, nil],
      [nil, nil, nil, nil, nil, nil, PLAYER_TWO],
      [nil, nil, nil, nil, nil, nil, nil],
    ]
  end

  def self.testing_check_winner_diagonal_left
    [
      [nil, nil, nil, nil, PLAYER_ONE, nil, nil],
      [nil, nil, nil, PLAYER_ONE, nil, nil, nil],
      [nil, nil, PLAYER_ONE, nil, nil, nil, nil],
      [nil, PLAYER_ONE, nil, nil, nil, nil, nil],
      [PLAYER_TWO, nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil],
    ]
  end

  def self.testing_game_end
    [
      [PLAYER_TWO, PLAYER_TWO, PLAYER_ONE, PLAYER_ONE, PLAYER_ONE, PLAYER_TWO, PLAYER_ONE],
      [PLAYER_ONE, PLAYER_ONE, PLAYER_TWO, PLAYER_TWO, PLAYER_TWO, PLAYER_ONE, PLAYER_TWO],
      [PLAYER_TWO, PLAYER_TWO, PLAYER_ONE, PLAYER_ONE, PLAYER_ONE, PLAYER_TWO, PLAYER_ONE],
      [PLAYER_ONE, PLAYER_ONE, PLAYER_TWO, PLAYER_TWO, PLAYER_TWO, PLAYER_ONE, PLAYER_TWO],
      [PLAYER_TWO, PLAYER_TWO, PLAYER_ONE, PLAYER_ONE, PLAYER_ONE,
       PLAYER_TWO, PLAYER_ONE],
      [PLAYER_ONE, PLAYER_ONE, PLAYER_TWO, PLAYER_TWO, PLAYER_TWO, PLAYER_ONE, PLAYER_TWO],
    ]
  end

  def self.testing_game_end_2
    [
      [nil, nil, nil, nil, nil, nil, PLAYER_TWO],
      [nil, nil, nil, nil, nil, nil, PLAYER_ONE],
      [nil, nil, nil, nil, nil, nil, PLAYER_TWO],
      [nil, nil, nil, nil, nil, nil, PLAYER_TWO],
      [nil, nil, nil, nil, nil, nil, PLAYER_TWO],
      [nil, nil, nil, nil, nil, nil, PLAYER_TWO],
    ]
  end
end
