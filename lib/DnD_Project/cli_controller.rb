require 'pry'

class CliController

  def start
    puts "Welcome to the Dungeons & Dragons 5th Edition Class Database!"
    puts "Please input which Character class you would like information for:"
    call
  end

def call
  # user_input = ''
  # while user_input.downcase != "exit"
    user_input = gets.strip
    result = CharacterKlass.all.detect do |klass|
      klass.name.downcase.include?(user_input.downcase)
    end
    puts result.name
  end


end
