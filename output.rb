class Output
  def self.show_result(parser)
    parser.get_numbers
    parser.calculations
    puts "Сумма всех чисел: #{parser.output[0]}"
    puts "Среднее значение: #{parser.output[1]}"    
  end
end