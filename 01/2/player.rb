# Class for controller a player
class Player
  def initialize(x, y)
    @x = x
    @y = y
    @direction = 'North'
    @visited = []
  end

  def update(action)
    rotation = action[0]
    steps = action[1..-1].to_i
    turn rotation
    walk steps
  end

  def distance_from_origo
    @x.abs + @y.abs
  end

  def found_revisit?
    @visited.uniq.length != @visited.length
  end

  private

  def turn(rotation)
    if rotation == 'L'
      turn_left
    else
      turn_right
    end
  end

  def turn_left
    @direction =
      case @direction
      when 'North' then 'West'
      when 'West'  then 'South'
      when 'South' then 'East'
      when 'East'  then 'North'
      end
  end

  def turn_right
    @direction =
      case @direction
      when 'North' then 'East'
      when 'East'  then 'South'
      when 'South' then 'West'
      when 'West'  then 'North'
      end
  end

  def walk(steps)
    while steps > 0
      take_step
      steps -= 1
      @visited << { x: @x, y: @y }
      break if found_revisit?
    end
  end

  def take_step
    case @direction
    when 'North' then @y += 1
    when 'South' then @y -= 1
    when 'East'  then @x += 1
    when 'West'  then @x -= 1
    end
  end
end
