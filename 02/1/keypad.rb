# A statemachine representing a Keypad. Always points to a number on the pad.
# A action (movement) will always use the current state and the action to create
# a new state.
class Keypad
  attr_reader :active_number

  TRANSFORM_RULES = {
    1 => { 'U' => 1, 'R' => 2, 'D' => 4, 'L' => 1 },
    2 => { 'U' => 2, 'R' => 3, 'D' => 5, 'L' => 1 },
    3 => { 'U' => 3, 'R' => 3, 'D' => 6, 'L' => 2 },
    4 => { 'U' => 1, 'R' => 5, 'D' => 7, 'L' => 4 },
    5 => { 'U' => 2, 'R' => 6, 'D' => 8, 'L' => 4 },
    6 => { 'U' => 3, 'R' => 6, 'D' => 9, 'L' => 5 },
    7 => { 'U' => 4, 'R' => 8, 'D' => 7, 'L' => 7 },
    8 => { 'U' => 5, 'R' => 9, 'D' => 8, 'L' => 7 },
    9 => { 'U' => 6, 'R' => 9, 'D' => 9, 'L' => 8 }
  }.freeze

  def initialize(start = 5)
    @active_number = start
  end

  def act_sequence(sequence)
    sequence.each { |action| act action }
  end

  def act(action)
    puts TRANSFORM_RULES[@active_number]
    @active_number = TRANSFORM_RULES[@active_number][action]
  end
end
