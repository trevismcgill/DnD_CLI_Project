require 'pry'

class CliController

  def start
    puts "Please wait. Loading database..."
    API.create_new_character_klass
    API.create_spell_library
    user_input = ""
    while user_input.downcase != "exit"
      puts "---------------------------------------"
      puts "Welcome to the Dungeons & Dragons 5th Edition Class Database!"
      puts "Would you like to know about Classes or Spells?"
      puts "You may also type 'exit' to terminate program."
    user_input = gets.strip
    if user_input.downcase == "classes"
      select_klass
    elsif user_input.downcase == "spells"
      format_list_of_spells
    else
    end
  end
  end

def select_klass
  user_input = ""
  while user_input.downcase != "exit"
  puts "---------------------------------------"
  puts "Please input which Character class you would like information for:"
  puts "You may also type 'exit' to return to the previous menu."
  list_classes
    user_input = gets.strip
    if user_input.downcase != "exit"
      result = CharacterKlass.all.detect do |klass|
        klass.index.include?(user_input.downcase)
      end
      puts "---------------------------------------"
      puts "Class - #{result.name}"
    # puts "Class Levels - #{result.class_levels}"
      puts "Hit Die - 1d#{result.hit_die}"
      puts "Saving Throws - #{result.saving_throws.collect {|hash| hash[:name]}.join(" & ")}"
      puts "Proficiencies - #{result.proficiencies.collect {|hash| hash[:name]}.join(", ")}"
    # puts "Starting Equipment - #{result.starting_equipment}"
      puts "Spell List- #{result.spells.collect {|spell_inst| spell_inst.name}.join(", ")}" if result.spells != []
    else
    end
  end
end

def list_classes
  klass_list = CharacterKlass.all.collect {|klass| klass.name}.join(", ")
  puts "---------------------------------------"
  puts klass_list
end

def format_list_of_spells
  user_input = ""
  while user_input.downcase != "exit"
    puts "---------------------------------------"
    puts "To see spells available to a Character Class: Type the name of the Class (i.e. 'Wizard')"
    puts "To see spells by spell level: Type a number 0-9"
    puts "To see spells by a particular School of Magic: Type the School name (i.e. 'Evocation')"
    puts "To see all spells: Type 'all'"
    puts "Type 'exit' to return to the previous menu."
    user_input = gets.downcase.strip
    if CharacterKlass.all.any? {|klass| klass.index.include?(user_input)}
      list_spells_by_klass(user_input)
    elsif user_input.match?(/\d/) && user_input.to_i.between?(0, 9)
      list_spells_by_level(user_input)
    elsif Spells.all.any? {|klass| klass.school.include?(user_input)}
      list_spells_by_school(user_input)
    elsif "all"
      list_spells_all
    elsif "exit"
      break
    else
      puts "Sorry, I don't recognize that command."
    end
  end
end

def select_spells
  puts "Please input which spell you would like information for:"
    user_input = gets.downcase.strip
    if user_input != "exit"
      result = Spells.all.detect do |spell|
        spell.name.downcase == user_input
      end
      puts "---------------------------------------"
      puts "Spell - #{result.name}"
      puts "Casting Time - #{result.casting_time}" if result.casting_time != nil
      puts "Available to - #{result.classes.collect {|klass| klass[:name]}.join(", ")}"
      puts "Casting Components - #{result.components.join}" if result.components != nil
      puts "Damage Type - #{result.damage[:damage_type][:name]}" if result.damage != nil
      puts "Description - #{result.desc.join}"
      puts "Duration - #{result.duration}" if result.duration != nil
      puts "Material Components - #{result.material}" if result.material != nil
      puts "Range - #{result.range}" if result.range != nil
      puts "School of Magic - #{result.school[:name]}"
      puts "Ritual" if result.ritual == true
    else
  end
end

def list_spells_all
  spell_list = Spells.all.collect {|spell| spell.name}.join(", ")
  puts spell_list
end

def list_spells_by_klass(input_klass)
  spell_list = Spells.all.select do |spell|
    spell.classes.any? {|hash| hash[:name].downcase == input_klass.downcase}
  end
 puts spell_list
end

def list_spells_by_level(input_level)
  spell_list = Spells.all.select do |spell|
    spell.level == input_level
  end
  puts spell_list
end

def list_spells_by_school(input_school)
  spell_list = Spells.all.select do |spell|
    spell.school.downcase == input_school.downcase
  end
 puts spell_list
end

end
