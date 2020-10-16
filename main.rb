require_relative 'lib/console_interface'
require_relative 'lib/game'

puts "Всем привет!"

# Загружаем случаное число из файла
word = File.readlines(__dir__ + '/data/words.txt', encoding: 'UTF-8', chomp: true).sample
game = Game.new(word)
console_interface = ConsoleInterface.new(game)

until game.over?
  # Выводим состояние игры
  console_interface.print_out
  # Спрашиваем букву у пользователя
  letter = console_interface.get_input
  # Обновляем состояние игры
  game.play!(letter)
end

console_interface.print_out
