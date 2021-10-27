File.new "numbers.txt","w"
file = File.open './numbers.txt', 'w'
rand(10..20).times {file.puts rand(100..999).to_s}
file.close