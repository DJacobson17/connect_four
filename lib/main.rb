require_relative 'connect_four'
require_relative 'player'
require_relative 'symbols'
require_relative 'board'

p1 = Player.new
p2 = Player.new
game = Game.new
game.play_game(p1, p2)
puts p1.color
puts p2.color
