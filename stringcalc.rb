class Calculator

  def add(string)
    return 0 if string.empty?  
    numbers = decompose(string).select { |n| n < 1000 }
    negatives = numbers.select { |n| n < 0 }
    if negatives.empty?
      return numbers.reduce { |acc, n| acc + n }
    else 
      raise "negatives not allowed: #{negatives.join(", ")}" 
    end 
  end

  def decompose(input)
    input.scan(/-?\d+,?/).map { |num| num.to_i }
  end

end
