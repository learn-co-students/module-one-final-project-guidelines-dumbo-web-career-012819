require 'open-uri'
require 'nokogiri'
require 'pry'
require 'Factbook'



# sovereign_countries = country_abrv.slice(0..195)



class Scraper
  # def self.scrape_abrv
  #   countries_hash.values.each do |value|
  #     "https://www.cia.gov/library/publications/the-world-factbook/geos/#{value}"
  #   end
    # https://www.cia.gov/library/publications/the-world-factbook/geos/

  def self.scrape(url)
    html = open(url)
    doc = Nokogiri::HTML(html)

    hash = {
        name: doc.css(".countryName").first.text.chomp,
        background: doc.css("#field-background").text.strip!,
        total_area: doc.css("#field-area .subfield-number").first.text.delete('^0-9').to_i,
        population: doc.css("#field-population .subfield-number").first.text.delete('^0-9').to_i,
        government_type: doc.css("#field-government-type").text.strip!,
        capital: doc.css("#field-capital div.category_data").first.text.gsub!("name:", "").strip!.nil?,
        languages: doc.css("#field-languages").text.strip!
    }

  end

end

# binding.pry
0

    # name = doc.css(".countryName").first.text
    # background = doc.css("#field-background").text
    # total_area = doc.css("#field-area .subfield-number").first.text
    # population = doc.css("#field-population .subfield-number").first.text
    # gov_type = doc.css("#field-government-type").text
    # capital = doc.css("#field-capital div.category_data").first.text.gsub!("name:", "")
    # languages = doc.css("#field-languages").text
