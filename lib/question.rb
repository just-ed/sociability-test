class Question
  attr_reader :text

  def initialize(question_line)
    parts = question_line.split('|')
    @text = parts[0]
    @is_inverted = parts[1] == 'inverted'
  end

  def inverted?
    @is_inverted
  end
end
