require './parser.rb'

  #определить тип документа и запустить соответствующий подкласс
puts 'Введите имя файла (.txt/.csv):'
file = gets.chomp  
if file.match?(/.csv$/)
  a = CsvParser.new (file)
  p 'csv'
elsif file.match?(/.txt$/)  
  a = TxtParser.new (file)
  p 'txt'
else
  raise "WRONG TYPE OF FILE!"
end




#отдельный класс
a.get_numbers
a.calculations
puts "Фаил #{file}"
puts "Сумма всех чисел: #{a.summ}"
puts "Среднее значение: #{a.avrg}"



