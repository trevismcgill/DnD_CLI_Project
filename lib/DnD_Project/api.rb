require "rest-client"
require "./lib/DnD_Project/character_klass"
require "json"
# require "csv"
require "pry"

class API
base_url = "http://www.dnd5eapi.co"
klass_url = "/api/classes"


response = RestClient.get("#{base_url}#{klass_url}")
dnd_klasses_hash = JSON.parse(response.body, symbolize_names:true)
dnd_klasses_array = dnd_klasses_hash[:results]

dnd_klasses_instances = dnd_klasses_array.collect do |klass|

response = RestClient.get("#{base_url}#{klass[:url]}")
dnd_klass_specific_hash = JSON.parse(response.body, symbolize_names:true)
CharacterKlass.new(dnd_klass_specific_hash)

end
  # binding.pry



# def self.json_to_csv
# csv_string = CSV.generate do |csv|
#   JSON.parse(File.open("set1-en_us.json").read).each do |hash|
#     csv << hash.values
#     binding.pry
#     end
#   end
#   csv_string
# end

end
