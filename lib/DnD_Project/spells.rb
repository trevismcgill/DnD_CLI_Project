require 'pry'

class Spells
attr_accessor :_id, :index, :name, :desc, :higher_level, :range, :components, :material, :ritual, :duration, :concentration, :casting_time, :level, :attack_type, :damage, :school, :classes, :subclasses, :url, :dc, :heal_at_slot_level,
:area_of_effect

@@all = []

def initialize(attributes)
  attributes.each {|key, value| self.send(("#{key}="), value)}
  @@all << self
  assign_to_klass
end

def self.all
  @@all
end

def assign_to_klass
  CharacterKlass.all.each do |klass_inst|
    if self.classes.any? {|klass| klass[:name] == klass_inst.name}
      klass_inst.spells << self
    end
  end
end

def self.spells_sorted_by_level
  self.all.sort_by {|spell| spell.level}
end
end
