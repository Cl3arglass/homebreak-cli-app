class HomeBreak::Region
  def self.today
    self.scrape_REG
  end

  def self.scrape_REG
    doc = Nokogiri::HTML(open("http://www.surfline.com/surf-forecasts/northern-california/sf-san-mateo-county_2957/#"))
    info = []
    doc.css('div.forecast-outlook').css('li').each do |el|
      info << el.text
    end
    info
  end
end
