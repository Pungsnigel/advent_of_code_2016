require 'minitest/autorun'
require_relative '../game'

#
class TestGame < Minitest::Test
  def test_revisit
    input = File.open('./inputs/revisit.txt', &:read).split(', ')
    game = Game.new input
    game.play
    assert_equal(4, game.player_distance_from_origo)
  end
end
