# A statemachine representing a Keypad. Always points to a number on the pad.
# A action (movement) will always use the current state and the action to create
# a new state.
class Keypad
  attr_reader :active_number

  TRANSFORM_RULES = {
    1   => { 'U' => nil, 'R' => nil, 'D' => 3,   'L' => nil },
    2   => { 'U' => nil, 'R' => 3,   'D' => 6,   'L' => nil },
    3   => { 'U' => 1,   'R' => 4,   'D' => 7,   'L' => 2   },
    4   => { 'U' => nil, 'R' => nil, 'D' => 8,   'L' => 3   },
    5   => { 'U' => nil, 'R' => 6,   'D' => nil, 'L' => nil },
    6   => { 'U' => 2,   'R' => 7,   'D' => 'A', 'L' => 5   },
    7   => { 'U' => 3,   'R' => 8,   'D' => 'B', 'L' => 6   },
    8   => { 'U' => 4,   'R' => 9,   'D' => 'C', 'L' => 7   },
    9   => { 'U' => nil, 'R' => nil, 'D' => nil, 'L' => 8   },
    'A' => { 'U' => 6,   'R' => 'B', 'D' => nil, 'L' => nil },
    'B' => { 'U' => 7,   'R' => 'C', 'D' => 'D', 'L' => 'A' },
    'C' => { 'U' => 8,   'R' => nil, 'D' => nil, 'L' => 'B' },
    'D' => { 'U' => 'B', 'R' => nil, 'D' => nil, 'L' => nil }
  }.freeze

  def initialize(start = 5)
    @active_number = start
  end

  def act_sequence(sequence)
    sequence.each { |action| act action }
  end

  def act(action)
    return if TRANSFORM_RULES[@active_number][action].nil?
    @active_number = TRANSFORM_RULES[@active_number][action]
  end
end
