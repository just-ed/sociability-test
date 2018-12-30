class ResultPrinter
  attr_reader :results

  def initialize(results_path)
    @results = File.readlines(results_path)
  end

  def print_result(points)
    if points > 29
      @results[0]
    elsif points > 24
      @results[1]
    elsif points > 18
      @results[2]
    elsif points > 13
      @results[3]
    elsif points > 8
      @results[4]
    elsif points > 3
      @results[5]
    else
      @results[6]
    end
  end
end
