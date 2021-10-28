class BaseParser 
  attr_reader :output

  def initialize (filename)
    @filename = filename
    @numbers = []
  end

  def check (data)    
      if valid?(data)
        return data
      else
        raise "File incorrect!"
      end
  end

  #проверить на валидность. ексепшн
  
  def valid? (num)
    condition = /^\d*$/
    return condition.match?(num)
  end
    
  #посчитать сумму и среднее 
  def calculations
    sum = 0
    @numbers.each {|x| sum += x.to_i }
    avrg = sum.to_f / @numbers.length
    @output = Array.new [sum, avrg]
  end

end

class TxtParser < BaseParser

  #прочитать строки
  def get_numbers
    File.open(@filename).read.each_line do |line|
      @numbers << check(line.strip)
    end
  end
end

class CsvParser < BaseParser
  
  #отделить числа от дат
  def get_numbers
    File.open(@filename).read.each_line do |line|
        @numbers << check(line.split(',')[1].strip)
    end
    @numbers.shift
  end
end
