class Calculator

  def add(string)
    addends = convert_string(string)
    return 0 if addends.empty?
    addends.reduce(0) { |sum, n| sum + n }
  end

  def convert_string(arg)
    remove_delimiters(arg).map { |n| n.to_i }
  end

  def remove_delimiters(arg)
    custom_delimiter = /\/\/(.)\n/
    delimiter = arg.scan(custom_delimiter).empty? ? "," : arg.scan(custom_delimiter)[0][0]
    arg.gsub(custom_delimiter, "").gsub("\n", ",").split(delimiter)
  end

end
