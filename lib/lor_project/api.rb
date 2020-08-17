require "rest-client"
require "./lib/lor_project/character_class"
require "json"
# require "csv"
require "pry"

class API

url = "http://www.dnd5eapi.co/api/classes"
response = RestClient.get(url)
binding.pry

dnd_hash = JSON.parse(response.body, symbolize_names:true)

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
