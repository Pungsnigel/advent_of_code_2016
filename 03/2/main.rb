valid_triangle = lambda do |side1, side2, side3|
  ordered = [side1, side2, side3].sort
  ordered[0] + ordered[1] > ordered[2]
end
sum = 0
File.readlines('./input.txt').each_slice(3) do |sequence|
  rows = sequence.map { |row| row.split(' ').map(&:to_i) }
  sum += 1 if valid_triangle.call(rows[0][0], rows[1][0], rows[2][0])
  sum += 1 if valid_triangle.call(rows[0][1], rows[1][1], rows[2][1])
  sum += 1 if valid_triangle.call(rows[0][2], rows[1][2], rows[2][2])
end

puts sum
