class Question
  attr_reader :text

  INVERTED_QUESTIONS = [4, 9, 10]

  def initialize(question)
    @text = question
  end

  def inverted_questions
    INVERTED_QUESTIONS
  end

  def inverted?(question)
    inverted_questions.include?(question)
  end
end
