require_relative 'keypad'

keypad = Keypad.new(5)
code = []

File.readlines('./input.txt').each do |sequence|
  keypad.act_sequence sequence.delete('^UDRL').split('')
  code << keypad.active_number
end

print code
