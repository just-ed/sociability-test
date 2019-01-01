class Test
  attr_reader :questions, :current_question, :points

  def initialize(questions_path)
    question_lines = File.readlines(questions_path, chomp: true)
    @questions = question_lines.map { |line| Question.new(line)}

    @points = 0
    @current_question = 0
  end

  def ask_question
    questions[current_question].text
  end

  def add_points(answer)
    if (answer == 1 && !questions[current_question].is_inverted) ||
       (answer == 2 &&  questions[current_question].is_inverted)
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
