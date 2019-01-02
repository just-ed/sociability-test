class Test
  attr_reader :points

  def initialize(questions_path)
    question_lines = File.readlines(questions_path, chomp: true)
    @questions = question_lines.map { |line| Question.new(line)}

    @points = 0
    @current_question_index = 0
  end

  def ask_question
    current_question.text
  end

  def add_points(answer)
    if (answer == 1 && !current_question.inverted?) ||
       (answer == 2 &&  current_question.inverted?)
      @points += 2
    elsif answer == 3
      @points += 1
    end

    next_question
  end

  def finished?
    @current_question_index == @questions.size
  end

  private

  def current_question
    @questions[@current_question_index]
  end

  def next_question
    @current_question_index += 1
  end
end
