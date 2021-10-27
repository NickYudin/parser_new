class BaseParser
  attr_reader :numbers, :summ , :average
  #определить тип документа и запустить соответствующий подкласс
  def initialize
    @file = File.open(ARGV[0], "r")
    @numbers = []
  end
  #открыть документ и прочитать строки
  def lines
    @lines = @file.each_line do |line|
      @numbers << check(line)
    end
  end

  def check (data)
    case valid?(data) 
      when true
        return data.strip 
      else
        raise "File incorrect!"
    end
  end

  #проверить на валидность. ексепшн
  
  def valid? (num)
    reg = /^\d+$/
    return reg.match?(num)
  end
  
  #ceate an array
  
  #посчитать сумму и среднее 
  def sum(array)
    @summ = 0
    array.each {|x| @summ += x.to_i }
    return @summ
  end

  def averag(array)
    @average = sum(array) / array.length
  end

end

class TxtParser < BaseParser

end

class CsvParser < BaseParser
  #отделить числа от дат
end
a = BaseParser.new
a.lines
a.averag(a.numbers)
puts a.summ
puts a.average
puts a.numbers.inspect
