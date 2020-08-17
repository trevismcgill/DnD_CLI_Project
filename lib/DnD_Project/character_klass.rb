class CharacterKlass
attr_accessor :name, :url

@@all = []

def initialize(attributes)
  attributes.each {|key, value| self.send(("#{key}="), value)}
  @@all << self
end

def self.all
  @@all
end

end
