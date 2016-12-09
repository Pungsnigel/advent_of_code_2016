require_relative 'game'
input_path = ARGV[0] || 'inputs/input.txt'

input = File.open(input_path, &:read).split(', ')
game = Game.new input
game.play

puts game.player_distance_from_origo
