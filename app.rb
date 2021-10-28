require './parser.rb'
require './output.rb'

  #определить тип документа и запустить соответствующий подкласс

def exept
  answer = gets.chomp.capitalize
  case answer
    when 'Y'
      start
    when 'N'
      print 'OK, bye!'
      exit
    else
      raise "I can't understand your answer" #понять как вызвать рескью внутри рескью
  end
end #loop break

def start

puts 'Введите имя файла (.txt/.csv):'
file = gets.chomp  
begin
  if file.match?(/.csv$/)
    @a = CsvParser.new (file)
  elsif file.match?(/.txt$/)  
    @a = TxtParser.new (file)
  else
    raise "Wrong type of file!  Use .txt or .csv file"
  end
rescue => exeption
  puts "#{exeption.message}. retry? (y/n)"
  exept
end
end

start
Output.show_result(@a)

#отдельный класс








