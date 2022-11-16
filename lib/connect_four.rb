# frozen_string_literal: true
require_relative 'symbols'

class Game # rubocop:disable Style/Documentation

  attr_accessor :p1, :p2, :game_over
  
  include Symbols

  def initialize
    @p1 = Player.new
    @p2 = Player.new
    instructions
    @game_over = false
  end

  def play_game(player = @p1)
    until game_over?
      move_selection(player)
      player_select(player)
    end
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

  def move_selection(player)
    puts "#{player.name} please select a column for your next move.(1-7)"
    loop do
      move = gets.chomp
      return move if verify_move(move)

      puts 'Input error! Please enter a number between 1 and 7.'
    end
  end
end


