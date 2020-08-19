require 'pry'

class Spells
attr_accessor :_id, :index, :name, :desc, :higher_level, :range, :components, :material, :ritual, :duration, :concentration, :casting_time, :level, :attack_type, :damage, :school, :classes, :subclasses, :url, :dc, :heal_at_slot_level,
:area_of_effect

@@all = []

def initialize(attributes)
  attributes.each {|key, value| self.send(("#{key}="), value)}
  @@all << self
  # assign_to_klass
end

def self.all
  @@all
end

def assign_to_klass
  CharacterKlass.all.each do |klass_inst|
    binding.pry
    if klass_inst.name == self.classes.each {|klass| klass[:name]}
      klass_inst.spells << self.name
    end
  end
end

end
