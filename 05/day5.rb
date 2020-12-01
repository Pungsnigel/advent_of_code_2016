# frozen_string_literal: true

require 'digest'
door_id = 'cxdnnyjw'

password_a = []
password_b = ('0'..'7').zip([]).to_h
index = '0'
until password_a.compact.count == 8 && password_b.values.compact.count == 8
  hash = Digest::MD5.hexdigest(door_id + index)
  index = index.next
  if hash.start_with?('00000')
    password_a << hash[5] unless password_a.length >= 8
    password_b[hash[5]] ||= hash[6] if password_b.keys.include?(hash[5])
  end
end
puts "Solution for part a: #{password_a.join}"
puts "Solution for part b: #{password_b.values.join}"
