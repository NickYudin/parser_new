class BaseParser 
  attr_reader :numbers, :summ , :avrg

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
  def sum(array)
    @summ = 0
    array.each {|x| @summ += x.to_i }
    return @summ
  end

  def calculations
    @avrg = sum(@numbers).to_f / @numbers.length
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
