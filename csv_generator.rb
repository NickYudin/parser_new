file =File.new "numbers.csv","w"

date = "#{rand(1..31)}/#{rand(1..12)}/#{rand(0..9)}#{rand(0..9)}"
file.puts 'Date, number'
rand(10..20).times {file.puts "#{date},#{rand(100..999)}"}
file.close