class CharacterKlass
attr_accessor :_id, :index, :name, :hit_die, :proficiency_choices, :proficiencies, :saving_throws, :spellcasting, :starting_equipment, :class_levels, :subclasses, :url

@@all = []

def initialize(attributes)
  attributes.each {|key, value| self.send(("#{key}="), value)}
  @@all << self
end

def self.all
  @@all
end

end
