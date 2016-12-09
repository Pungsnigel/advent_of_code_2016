require 'minitest/autorun'
require_relative '../game'

#
class TestGame < Minitest::Test
  def test_circular_movement
    input = File.open('./inputs/test_case_4.txt', &:read).split(', ')
    game = Game.new input
    game.play
    assert_equal(0, game.player_distance_from_origo)
  end

  def test_back_and_reverse
    input = File.open('./inputs/test_case_5.txt', &:read).split(', ')
    game = Game.new input
    game.play
    assert_equal(0, game.player_distance_from_origo)
  end

  def test_right_and_back_left
    input = File.open('./inputs/test_case_6.txt', &:read).split(', ')
    game = Game.new input
    game.play
    assert_equal(0, game.player_distance_from_origo)
  end

  def test_base_base_1
    input = File.open('./inputs/test_case_1.txt', &:read).split(', ')
    game = Game.new input
    game.play
    assert_equal(5, game.player_distance_from_origo)
  end

  def test_base_base_2
    input = File.open('./inputs/test_case_2.txt', &:read).split(', ')
    game = Game.new input
    game.play
    assert_equal(2, game.player_distance_from_origo)
  end

  def test_base_base_3
    input = File.open('./inputs/test_case_3.txt', &:read).split(', ')
    game = Game.new input
    game.play
    assert_equal(12, game.player_distance_from_origo)
  end

  def test_random_movements
    input = File.open('./inputs/test_case_7.txt', &:read).split(', ')
    game = Game.new input
    game.play
    assert_equal(209, game.player_distance_from_origo)
  end
end
