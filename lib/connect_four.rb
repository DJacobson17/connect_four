# frozen_string_literal: true

require_relative 'symbols'
require_relative 'player'
require_relative 'board'

class Game # rubocop:disable Style/Documentation
  attr_accessor :p1, :p2, :game_over

  include Symbols

  def initialize
    @p1 = Player.new
    @p2 = Player.new
    instructions
    @board = Board.new
    @game_over = false
  end

  def play_game(player = @p1)
    loop do
      @board.display_board
      column = column_selection(player)
      row = @board.update_board(column, player)
      break if @board.check_vertical(row, column, player.color)
      break if @board.check_horizontal(row, player.color) 

      player = player_select(player)
    end
    @board.display_board
  end

  def instructions
    puts  <<~HEREDOC



          WELCOME TO CONNECT FOUR

      Connect 4 is a two-player connection board game,in#{' '}
      which the players choose a color and then take turns#{' '}
      dropping colored tokens into a seven-column,#{' '}
      six-row vertically suspended grid. The pieces fall#{' '}
      straight down, occupying the lowest available space#{' '}
      within the column. The objective of the game is to be#{' '}
      the first to form a horizontal, vertical, or diagonal#{' '}
      line of four of one's own tokens.


    HEREDOC
  end

  def player_select(player)
    player == @p1 ? @p2 : @p1
  end

  def column_selection(player)
    puts "#{player.name} please select a column for your next move.(1-7)"
    loop do
      column = gets.chomp.to_i - 1
      return column if verify_move(column)

      puts "Input error! Please enter a number between 1 and 7. Be sure it's not full"
    end
  end

  def verify_move(column)
    column.between?(0, 6) && @board.grid[0][column] == empty_space
  end
end
