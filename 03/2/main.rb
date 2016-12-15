triangles = (File.readlines('./input.txt').map do |row|
  row.split(' ').map(&:to_i)
end).transpose.flatten.each_slice(3).to_a

puts triangles.map(&:sort).count { |sides| sides[0] + sides[1] > sides[2] }
