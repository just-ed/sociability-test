require_relative 'lib/test'
require_relative 'lib/result_printer'

test = Test.new

# Проводим тест, пока не закончатся вопросы
until test.finished? do
  test.next_question
end

result = ResultPrinter.new

# Выводим результат теста
puts result.print_result(test)
