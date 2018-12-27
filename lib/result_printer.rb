class ResultPrinter

  def initialize
    # Записываем результаты теста в массив
    @results = []

    # Каждый из семи результатов записан в отдельном текстовом файле
    # Сохраняем названия этих файлов
    results_files = Dir["#{__dir__}/../data/results/*.txt"].sort

    # Открываем каждый файл и записываем его содержимое в массив с результатами
    results_files.each do |file|
      f = File.new(file, "r:UTF-8")
      result = f.read
      f.close

      @results << result
    end
  end

  # Метод для вывода на экран результата теста в зависимости от количества набранных баллов
  def print_result(test)
    puts "\nВаш результат (количество набранных баллов - #{test.points}):\n\n"

    if test.points > 29
      @results[0]
    elsif test.points > 24
      @results[1]
    elsif test.points > 18
      @results[2]
    elsif test.points > 13
      @results[3]
    elsif test.points > 8
      @results[4]
    elsif test.points. > 3
      @results[5]
    else
      @results[6]
    end
  end
end
