require './parser.rb'

  #определить тип документа и запустить соответствующий подкласс
if ARGV[0].match?(/.csv$/)
  a = CsvParser.new
  p 'csv'
elsif ARGV[0].match?(/.txt$/)  
  a = TxtParser.new   
  p 'txt'
else
  raise "WRONG TYPE OF FILE!"
end
a.get_numbers
#a.check
a.calculations
puts "Фаил #{ARGV[0]}"
puts "Сумма всех чисел: #{a.summ}"
puts "Среднее значение: #{a.avrg}"



