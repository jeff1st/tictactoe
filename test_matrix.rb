require 'matrix'

a = Matrix[[0, 0, 0], [0, 0, 0], [0, 0, 0]]
b = Matrix[[1, 2, 3], [4, 5, 6], [7, 8, 9]]

puts "Game table \t Your choices left"

(0...3).each do |i|
  puts "|#{a[i, 0]} #{a[i, 1]} #{a[i, 2]}| \t |#{b[i, 0]} #{b[i, 1]} #{b[i, 2]}|"
end

