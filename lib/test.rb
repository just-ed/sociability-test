class Test
  attr_reader :points

  def initialize
    # Открываем текстовый файл с вопросами, записываем их построчно в массив вопросов
    @questions = File.readlines("#{__dir__}/../data/questions.txt")

    #Вопросы с обратным смыслом
    @inverted_questions = [4, 9, 10]

    # Счетчик баллов
    @points = 0

    # Счетчик вопросов
    @current_question = 0
  end

    # Метод, определяющий закончен ли тест
  def finished?
    @current_question == @questions.size
  end

  # Метод, определяющий является ли вопрос инвертированным
  def inverted?(question)
    @inverted_questions.include?(question)
  end

  # Метод для подсчета баллов
  def add_points(question, answer)
    # Увеличить количество баллов на 2 в случаях:
    # если пользователь ответил "1" на "правильные" вопросы
    # если пользователь ответил "2" на вопросы с обратным смыслом
    if (answer == 1 && !inverted?(question)) ||
       (answer == 2 &&  inverted?(question))
      @points += 2
      # Если пользователь ответил "3" - увеличить количество баллов на 1
    elsif answer == 3
      @points += 1
    end

    @points
  end

  # Метод для вывода на экран следующего вопроса и предложения ответить на него
  def next_question
    # Выводим на экран текущий вопрос
    puts @questions[@current_question]

    # Просим ввести ответ пока пользователь не выберет один из предлагаемых вариантов
    answer = nil

    until answer == 1 || answer == 2 || answer == 3
      puts 'введите число: 1 – да, 2 – нет, 3 – иногда, и нажмите Enter'
      answer = STDIN.gets.to_i
    end

    # Добавляем баллы - 0, 1 или 2 в зависимости от полученного ответа
    add_points(@current_question, answer)

    # Переходим к следующему вопросу
    @current_question += 1
  end
end
