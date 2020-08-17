require "rest-client"
require "json"
require "csv"
require "pry"

class Api

def self.json_to_csv
csv_string = CSV.generate do |csv|
  JSON.parse(File.open("set1-en_us.json").read).each do |hash|
    csv << hash.values
    binding.pry
    end
  end
  csv_string
end

end
