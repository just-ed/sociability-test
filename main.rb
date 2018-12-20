# Запрашиваем файлы с классами Test и ResultPrinter
require_relative 'test'
require_relative 'result_printer'

# Создаем экземпляр класса Test и сохраняем его в переменную test
test = Test.new

# Проводим тест, пока не закончатся вопросы
until test.finished? do
  test.next_question
end

# Создаем экземпляр класса ResultPrinter и сохраняем его в переменную result
result = ResultPrinter.new

# Выводим результат теста
puts result.print_result(test)
