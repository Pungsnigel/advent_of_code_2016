ALPHABET = ('A'..'Z').to_a.freeze
Room = Struct.new(:name, :id)

def decrypt_name(name, shift_amount)
  name.tr(ALPHABET.join, ALPHABET.rotate(shift_amount % ALPHABET.length).join)
end

input = File.readlines('./input.txt').map { |row| row.chomp.split('-') }

rooms = input.map do |room|
  Room.new(room[0...-1].join, room[-1].split('[')[0].to_i)
end

suspicious_rooms = rooms.select do |room|
  real_name = decrypt_name(room.name.upcase, room.id)
  real_name.match('NORTH') && real_name.match('POLE')
end

puts suspicious_rooms
