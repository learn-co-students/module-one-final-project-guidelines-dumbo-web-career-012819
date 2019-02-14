require_relative "../config/environment.rb"
require 'Factbook'

countries_hash = {}
codes = Factbook.codes.countries
codes.each do |country|
   countries_hash[country.name] = country.code
end

countries_hash.values.each do |value|
  if value != "ch" && value != "nr"
    Country.create(Scraper.scrape("https://www.cia.gov/library/publications/the-world-factbook/geos/#{value}.html"))
  elsif value == "nr"
    Country.create(Scraper.nauru_scrape)
  elsif value == "ch"
    Country.create(Scraper.chinese_scrape)
  end
end
