# Class for controller a player
class Player
  def initialize(x, y)
    @x = x
    @y = y
    @direction = 'North'
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
    case @direction
    when 'North' then @y += steps
    when 'South' then @y -= steps
    when 'East'  then @x += steps
    when 'West'  then @x -= steps
    end
  end
end
