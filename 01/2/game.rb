require_relative 'player'

# Game - takes a input stream of commands,
#  and moves its internal player accordingly
class Game
  def initialize(input_stream)
    @input_stream = input_stream
    @player = Player.new(0, 0)
  end

  def player_distance_from_origo
    @player.distance_from_origo
  end

  def play
    @input_stream.each do |action|
      @player.update action
      break if @player.found_revisit?
    end
  end
end
