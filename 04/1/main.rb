class Room
  attr_reader :name, :id, :checksum

  def initialize(name, id, checksum)
    @name = name
    @id = id
    @checksum = checksum
  end

  def valid?
    sorted_name = name.chars.sort do |a, b|
      if name.count(b) != name.count(a)
        name.count(b) <=> name.count(a)
      else
        a <=> b
      end
    end
    sorted_name.uniq[0..4].join == checksum
  end
end

input = File.readlines('./input.txt').map { |row| row.chomp.split('-') }

rooms = input.map do |room|
  name     = room[0...-1].join
  id       = room[-1].split('[')[0].to_i
  checksum = room[-1].split('[')[1].tr(']', '')
  Room.new(name, id, checksum)
end

puts rooms.select(&:valid?).map(&:id).reduce(:+)
