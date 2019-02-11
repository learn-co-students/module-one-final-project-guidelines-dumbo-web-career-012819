require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape(url)
    html = open(url)
    doc = Nokogiri::HTML(html)

    hash = {
        name: doc.css(".countryName").first.text,
        background: doc.css("#field-background").text,
        total_area: doc.css("#field-area .subfield-number").first.text,
        population: doc.css("#field-population .subfield-number").first.text,
        gov_type: doc.css("#field-government-type").text,
        capital: doc.css("#field-capital div.category_data").first.text.gsub!("name:", ""),
        languages: doc.css("#field-languages").text
    }

  end

end


    # name = doc.css(".countryName").first.text
    # background = doc.css("#field-background").text
    # total_area = doc.css("#field-area .subfield-number").first.text
    # population = doc.css("#field-population .subfield-number").first.text
    # gov_type = doc.css("#field-government-type").text
    # capital = doc.css("#field-capital div.category_data").first.text.gsub!("name:", "")
    # languages = doc.css("#field-languages").text