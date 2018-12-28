require_relative 'lib/test'
require_relative 'lib/result_printer'

questions_path = "#{__dir__}/data/questions.txt"
results_path = "#{__dir__}/data/results/*.txt"

inverted_questions = [4, 9, 10]

test = Test.new(questions_path, inverted_questions)

result = ResultPrinter.new(results_path)

until test.finished? do
  puts test.ask_question(test.current_question)

  answer = nil

  until answer == 1 || answer == 2 || answer == 3
    puts 'введите число: 1 – да, 2 – нет, 3 – иногда, и нажмите Enter'
    answer = STDIN.gets.to_i
  end

  test.add_points(test.current_question, answer)

  test.current_question += 1
end

puts result.print_result(test)
