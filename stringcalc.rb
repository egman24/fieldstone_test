class Calc
  def add(string)
    return 0 if string.empty?
    return string.split(/,/).map { |string| string.to_i}.inject { |acc, n| acc + n } 
  end
end
