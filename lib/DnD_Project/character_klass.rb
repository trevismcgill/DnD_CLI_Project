require 'pry'

class CharacterKlass
attr_accessor :_id, :index, :name, :hit_die, :proficiency_choices, :proficiencies, :saving_throws, :spellcasting, :starting_equipment, :class_levels, :subclasses, :url

@@all = []

def initialize(attributes)
  attributes.each {|key, value| self.send(("#{key}="), value)}
  @@all << self
  @spells = []
end

def self.all
  @@all
end

def add_spell(spell)
  @spelss << spell

end
