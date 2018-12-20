class Test
  attr_reader :points

  def initialize
    # Открываем текстовый файл с вопросами, записываем построчно в массив вопросов
    @questions = []

    f = File.new("#{__dir__}/data/questions.txt", "r:UTF-8")
    @questions = f.readlines
    f.close

    # Счетчик баллов
    @points = 0

    # Счетчик вопросов
    @current_question = 0
  end

    # Метод, определяющий закончен ли тест
  def finished?
    @current_question == @questions.size
  end

  # Метод для вывода на экран следующего вопроса и предложения ответить на него
  def next_question
    # Выводим на экран текущий вопрос
    puts @questions[@current_question]

    # Просим ввести ответ пока пользователь не выберет один из предлагаемых вариантов
    user_input = nil

    until user_input == 1 || user_input == 2 || user_input == 3
      puts "введите число: 1 – да, 2 – нет, 3 – иногда, и нажмите Enter"
      user_input = STDIN.gets.to_i
    end

    # Переменная, определяющая вопросы с обратным смыслом
    inverted = [4, 9, 10].include?(@current_question)

    # Увеличить количество баллов на 2 в случаях:
    # если пользователь ответил "1" на "правильные" вопросы
    # если пользователь ответил "2" на вопросы с обратным смыслом
    if (user_input == 1 && !inverted) ||
       (user_input == 2 &&  inverted)
      @points += 2
    # Если пользователь ответил "3" - увеличить количество баллов на 1
    elsif user_input == 3
      @points += 1
    end

    # Переходим к следующему вопросу
    @current_question += 1
  end
end
