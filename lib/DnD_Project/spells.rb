require 'pry'

class Spells
attr_accessor :_id, :index, :name, :desc, :higher_level, :range, :components, :material, :ritual, :duration, :concentration, :casting_time, :level, :attack_type, :damage, :school, :classes, :subclasses, :url, :dc, :heal_at_slot_level,
:area_of_effect

@@all = []

def initialize(attributes)
  attributes.each {|key, value| self.send(("#{key}="), value)}
  @@all << self
end

def self.all
  @@all
end

end
