# frozen_string_literal: true
require_relative 'symbols'
class Player # rubocop:disable Style/Documentation
  attr_accessor :count, :name, :color

  include Symbols

  @@count = 0
  def initialize
    @name = enter_name
    if @@count == 1
      puts "#{name} choose a color:  'r' for Red or 'y' for Yellow"
      @color = pick_color
    else
      @color = give_color
    end
  end

  def enter_name
    @@count += 1
    puts "Player #{@@count} what is your name?"
    gets.chomp.capitalize
  end

  def pick_color
    @@color_choices = ['r', 'y']
    loop do
      color = gets.chomp.downcase
      if verify_color(color)
        @@color_choices.delete(color)
        return color == 'r' ? red_space : yellow_space
      end
      puts "Input error! Please enter an 'r' or a 'y'."
    end
  end

  def verify_color(color)
    %w[r y].include?(color)
  end

  def give_color
    @@color_choices.include?('y') ? yellow_space : red_space
  end
end

