# frozen_string_literal: true
class Player # rubocop:disable Style/Documentation
  attr_accessor :count, :name, :color

  @@count = 0
  def initialize
    @name = enter_name
    @color = nil
  end

  def enter_name
    @@count += 1
    puts "Player #{@@count} what is your name?"
    gets.chomp.capitalize
  end
end
# p1 = Player.new
# p2 = Player.new
# puts p1.name
# puts p2.name