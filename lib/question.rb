class Question
  attr_reader :text, :is_inverted

  def initialize(question_line)
    parts = question_line.split('|')
    @text = parts[0]
    @is_inverted = parts[1] == 'inverted'
  end
end
