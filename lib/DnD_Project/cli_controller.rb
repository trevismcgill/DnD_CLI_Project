require 'pry'

class CliController

  def start
    puts "Welcome to the Dungeons & Dragons 5th Edition Class Database!"
    puts "Would you like to know about Classes or Spells?"
    API.create_new_character_klass
    API.create_spell_library
    user_input = gets.strip
    if user_input.downcase == "classes"
      select_klass
    elsif user_input.downcase == "spells"
      select_spells
    else
    end
  end

def select_klass
  # user_input = ''
  # while user_input.downcase != "exit"
  puts "Please input which Character class you would like information for:"
  list_classes
    user_input = gets.strip
    result = CharacterKlass.all.detect do |klass|
      klass.index.include?(user_input.downcase)
    end
    puts "Class - #{result.name}"
    puts "Class Levels - #{result.class_levels}"
    puts "Subclasses - #{result.subclasses.collect {|hash| hash[:name]}.join(" & ")}"
    puts "Hit Die - 1d#{result.hit_die}"
    puts "Saving Throws - #{result.saving_throws.collect {|hash| hash[:name]}.join(" & ")}"
    puts "Proficiencies - #{result.proficiencies.collect {|hash| hash[:name]}.join(", ")}"
    puts "Starting Equipment - #{result.starting_equipment}"
    puts "Spellcasting - #{result.spellcasting}" if result.spellcasting != nil
  end

def list_classes
  klass_list = CharacterKlass.all.collect {|klass| klass.name}.join(", ")
  puts klass_list
end

def select_spells
  puts "Please input which spell you would like information for:"
  list_spells
end

def list_spells
  spell_list = Spells.all.collect {|klass| klass.name}.join(", ")
  puts spell_list
end


end
