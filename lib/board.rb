require_relative 'symbols'

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
end

  Board.new.display_board
