class Test
  attr_reader :points
  attr_accessor :current_question

  def initialize(questions, inverted_questions)
    @questions = File.readlines(questions)
    @inverted_questions = inverted_questions

    @current_question = 0

    @points = 0
  end

  def finished?
    @current_question == @questions.size
  end

  def inverted_question?(question)
    @inverted_questions.include?(question)
  end

  # Метод для подсчета баллов
  def add_points(question, answer)
    # Увеличить количество баллов на 2 в случаях:
    # если пользователь ответил "1" на "правильные" вопросы
    # если пользователь ответил "2" на вопросы с обратным смыслом
    if (answer == 1 && !inverted_question?(question)) ||
       (answer == 2 &&  inverted_question?(question))
      @points += 2
      # Если пользователь ответил "3" - увеличить количество баллов на 1
    elsif answer == 3
      @points += 1
    end

    @points
  end

  def ask_question(current_question)
    @questions[current_question]
  end
end
