# frozen_string_literal: true
PLAYER_ONE = 'PLAYER ONE'
PLAYER_TWO = 'PLAYER TWO'

class ConnectFour
  attr_accessor :array

  def initialize
    @array = Array.new(6) { Array.new(7) { nil } }
  end

  def check
    @array.each_with_index do |row, i|
      row.each_index do |j|
        return row[j] if check_winner_horizontal(i, j)
        return row[j] if check_winner_vertical(i, j)
        return row[j] if check_winner_diagonal_right(i, j)
        return row[j] if check_winner_diagonal_left(i, j)
      end
    end
    nil
  end

  # TODO: Differentiate Player 1 and Player 2
  def player_input(column, player = PLAYER_ONE)
    return unless column.between?(1, 7)

    (@array.length - 1).downto(0) do |i|
      return @array[i][column - 1] = player if (@array[i][column - 1].nil?)
    end
  end

  def check_winner_horizontal(row, column)
    return false if !row.between?(0, @array.length - 1) or !column.between?(0, @array.length - 4)
    @array[row][column..column + 3].all? { |v| v == @array[row][column] && !v.nil? }
  end

  def check_winner_vertical(row, column)
    row.upto(row + 3) do |i|
      return false if @array[i].nil?
      value = @array[i][column]
      return false if value != @array[row][column] or value.nil?
    end
    true
  end

  def check_winner_diagonal_right(row, column)
    row.upto(row + 3) do |i|
      return false if @array[i].nil?
      value = @array[i][column + i - row]
      return false if value.nil? or value != @array[row][column]
    end
    true
  end

  def check_winner_diagonal_left(row, column)
    row.upto(row + 3) do |i|
      return false if @array[i].nil?
      value = @array[i][column + row - i]
      return false if value != @array[row][column] or value.nil?
    end
    true
  end

  def game_end?
    @array.each { |row| row.each { |cell| return false if cell.nil? } }
    true
  end

  def to_s
    output = "   |" + (1..7).map { |i| "  #{i}  |" }.join + "\n"
    @array.each_with_index do |row, i|
      output += "#{i + 1}  |"
      row.each do |cell|
        output += "  \e[31m\u25CF\e[0m  |" if cell == PLAYER_ONE # Red dot
        output += "  \e[33m\u25CF\e[0m  |" if cell == PLAYER_TWO # Yellow dot
        output += "  ○  |" if cell.nil?
      end
      output += "\n"
    end
    output + "\n"
  end
end
