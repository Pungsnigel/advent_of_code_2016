valid_triangles = File.readlines('./input.txt').count do |sequence|
  sides = sequence.split(' ').map(&:to_i).sort
  (sides[0] + sides [1]) > sides[2]
end

puts valid_triangles