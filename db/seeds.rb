require_relative "../config/environment.rb"

countries_hash = {}
codes = Factbook.codes.countries
codes.each do |country|
   countries_hash[country.name] = country.code
end

# blacklist = ["China", "Westbank"]

countries_hash.values.each do |value|
  Country.create(Scraper.scrape("https://www.cia.gov/library/publications/the-world-factbook/geos/#{value}.html")) unless value == "ch" || value == "nr"
end

binding.pry
0
