class StringCalc
  def add(args)
    return 0 if args == ""
    if args =~ /\/\/.\n/ 
      return accumulate(check_negative(custom_delimiters(args)))
    else
      return accumulate(check_negative(standard_delimiters(args)))
    end
  end  

  private

  def accumulate(input)
    input.reduce(0) { |acc, n| acc + n.to_i}
  end

  def check_negative(input)
    input
  end

  def custom_delimiters(input)
    parse_delimiter(input)  
  end

  def parse_delimiter(input)
    substring = input[4..-1]
    transform_delimiters( :delimiter => input[2], :args => substring)
  end

  def remove_commas(input)
    input.split(/,/)
  end

  def standard_delimiters(input)
    remove_commas(transform_newlines(input))
  end

  def transform_delimiters(input={})
    input[:args].split(input[:delimiter])
  end

  def transform_newlines(input)
    input.gsub(/\n/, ',')
  end
end
