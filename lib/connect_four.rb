# frozen_string_literal: true
require_relative 'symbols'

class Game # rubocop:disable Style/Documentation
  include Symbols

  def initialize
    @p1 = Player.new
    @p2 = Player.new
    instructions
    @p1.color = pick_color
    @p2.color = give_color(@p1)
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

      #{@p1.name} choose a color:  R for Red
                       Y for Yellow

    HEREDOC
  end

  def pick_color
    loop do
      color = gets.chomp.downcase
      if verify(color)
        return color == 'r' ? red_space : yellow_space
      end

      puts "Input error! Please enter an 'R' or a 'Y'."
    end
  end

  def verify(color)
    %w[r y].include?(color)
  end

  def give_color(p1)
    p1.color == red_space ? yellow_space : red_space
  end

  def player_select(player)
    player == @p1 ? @p2 : @p1
  end
end


