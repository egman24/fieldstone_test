class Calculator

  def add(string)
    return 0 if string.empty?  
    numbers   = decompose(string)
    negatives = numbers.select { |n| n < 0 }
    
   if negatives.empty?
      return numbers.reduce { |acc, n| acc + n }
    else 
      raise "negatives not allowed: #{negatives.join(", ")}" 
    end 
  end

  private

  def decompose(input)
    max_threshold( extract_numbers( input ) )
  end

  def extract_numbers(input)
    input.scan(/-?\d+,?/).map { |num| num.to_i } 
  end

  def max_threshold(input)
    input.select { |n| n < 1000 }
  end

end
