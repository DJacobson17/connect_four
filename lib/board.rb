require_relative 'symbols'
require 'pry-byebug'

class Board

  include Symbols

  attr_reader :grid

  def initialize
    @grid = Array.new(6) { Array.new(7) { empty_space } }
  end

  def display_board
    @grid.each do |row|
      puts row.join(' ')
    end
    puts (1..7).to_a.join(' ')
  end

  def update_board(move, player)
    @grid.reverse_each do |row|
      next unless row[move] == empty_space

      row[move] = player.color
      return @grid.find_index(row)
    end
  end

  def check_win(row, column, color)
    check_vertical(row, column, color)
  end

  def check_vertical(row, column, color)
    return if row > 2

    @grid[row][column] == color && @grid[row + 1][column] == color && @grid[row + 2][column] == color && @grid[row + 3][column] == color
  end

  def check_horizontal(row, color)
    @grid[row].each_index do |index|
      # binding.pry
      next unless color == @grid[row][index] && color == @grid[row][index + 1] && color == @grid[row][index + 2] && color == @grid[row][index + 3]

      return true
    end
    false
  end

  def check_diagonal(color)
    check_left_diagonal(color) || check_right_diagonal(color)
  end

  def check_left_diagonal(color)
    0.upto(2) do |row|
      0.upto(3) do |column|
        if color == @grid[row][column] && color == @grid[row + 1][column + 1] && color == @grid[row + 2][column + 2] && color == @grid[row + 3][column + 3] && !@grid[row][column].nil?
          return true
        end
      end
    end
    false
  end

  def check_right_diagonal(color)
    5.downto(3) do |row|
      0.upto(3) do |column|
        if color == @grid[row][column] && color == @grid[row - 1][column + 1] && color == @grid[row - 2][column + 2] && color == @grid[row - 3][column + 3] && !@grid[row][column].nil?
          return true
        end
      end
    end
    false
  end
  def check_draw
    @grid.flatten.none?(empty_space)
  end
  
end


