class Test
  attr_reader :questions, :current_question, :points

  def initialize(questions)
    @questions = questions
    @points = 0
    @current_question = 0
  end

  def ask_question
    questions[current_question].text
  end

  def add_points(answer)
    if (answer == 1 && !questions[current_question].inverted?(current_question)) ||
       (answer == 2 &&  questions[current_question].inverted?(current_question))
      @points += 2
    elsif answer == 3
      @points += 1
    end
  end

  def finished?
    current_question == questions.size
  end

  def next_question
    @current_question += 1
  end
end
