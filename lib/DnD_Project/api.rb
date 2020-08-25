require "rest-client"
require "./lib/DnD_Project/character_klass"
require "./lib/DnD_Project/spells"
require "json"
require "pry"

class API
@@base_url = "http://www.dnd5eapi.co"


def self.create_new_character_klass
klass_url = "/api/classes"
response = RestClient.get("#{@@base_url}#{klass_url}")
dnd_klasses_hash = JSON.parse(response.body, symbolize_names:true)
dnd_klasses_array = dnd_klasses_hash[:results]

dnd_klasses_array.collect do |klass|
  response = RestClient.get("#{@@base_url}#{klass[:url]}")
  dnd_klass_specific_hash = JSON.parse(response.body, symbolize_names:true)
  CharacterKlass.new(dnd_klass_specific_hash)
  end
end

def self.create_spell_library
spell_url = "/api/spells"
response = RestClient.get("#{@@base_url}#{spell_url}")
spells_hash = JSON.parse(response.body, symbolize_names:true)
spells_array = spells_hash[:results]

spells_array.collect do |spell|
  response = RestClient.get("#{@@base_url}#{spell[:url]}")
  individual_spell_hash = JSON.parse(response.body, symbolize_names:true)
  Spells.new(individual_spell_hash)
  end
end

end
