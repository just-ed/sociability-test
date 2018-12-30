require_relative 'lib/question'
require_relative 'lib/test'
require_relative 'lib/result_printer'

questions_path = "#{__dir__}/data/questions.txt"
results_path = "#{__dir__}/data/results.txt"

questions_file = File.new(questions_path)
questions = []
questions_file.each_line { |line| questions << Question.new(line) }

test = Test.new(questions)

result = ResultPrinter.new(results_path)

until test.finished?
  puts test.ask_question

  answer = nil
  until [1, 2, 3].include?(answer)
    puts 'введите число: 1 – да, 2 – нет, 3 – иногда, и нажмите Enter'
    answer = STDIN.gets.to_i
  end

  test.add_points(answer)

  test.next_question
end

puts "\nВаш результат (количество набранных баллов - #{test.points}):\n\n"
puts result.print_result(test.points)
