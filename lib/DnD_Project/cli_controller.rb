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
      select_spells
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
      puts "Spell List- #{result.spells.join(", ")}" if result.spells != []
    else
    end
  end
end

def list_classes
  klass_list = CharacterKlass.all.collect {|klass| klass.name}.join(", ")
  puts "---------------------------------------"
  puts klass_list
end

def select_spells
  user_input = ""
  while user_input.downcase != "exit"
    puts "---------------------------------------"
    puts "Please input which spell you would like information for:"
    puts "You may also type 'exit' to return to the previous menu."
    list_spells
    user_input = gets.strip
    if user_input.downcase != "exit"
      result = Spells.all.detect do |spell|
        spell.name.downcase == user_input.downcase
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
end

def list_spells
  spell_list = Spells.all.collect {|klass| klass.name}.join(", ")
  puts spell_list
end


end
