class HomeBreak::Scraper

  def self.scrape_today
    self.scrape_REG
    self.scrape_OBO
    self.scrape_SOB
    self.scrape_PCL
  end

  def self.scrape_REG
   doc = Nokogiri::HTML(open("http://www.surfline.com/surf-forecasts/northern-california/sf-san-mateo-county_2957/#"))
    description = doc.css('div.forecast-outlook').css('li').collect {|el| el.text}

    HomeBreak::Region.new(description)
    
  end

  def self.scrape_OBO
    doc = Nokogiri::HTML(open("http://www.surfline.com/surf-report/ocean-beach-overview-northern-california_4127/"))
     name = doc.search("h3")[6].text.split(' ')[3..-1].join(' ')
     height = doc.search("h2").last.text
     description = doc.css("span#observed-wave-description").last.text.delete("\n")
     description = description[1..-1]
     description = description.lstrip
     conditions = doc.css("div#observed-spot-conditions").text

     HomeBreak::Break.new(name, height, description, conditions)


  end

  def self.scrape_SOB
    doc = Nokogiri::HTML(open("http://www.surfline.com/surf-report/south-ocean-beach-northern-california_4128/"))
     name = doc.search("h3")[6].text.split(' ')[3..-1].join(' ')
     height = doc.search("h2").last.text
     description = doc.css("span#observed-wave-description").last.text.delete("\n")
     description = description[1..-1]
     description = description.lstrip
     conditions = doc.css("div#observed-spot-conditions").text


    HomeBreak::Break.new(name, height, description, conditions)
  end

  def self.scrape_PCL
    doc = Nokogiri::HTML(open("http://www.surfline.com/surf-report/pacifica-lindamar-northern-california_5013/"))

    name = doc.search("h3")[6].text.split(' ')[3..-1].join(' ')
    height = doc.search("h2").last.text
    description = doc.css("span#observed-wave-description").last.text.delete("\n")
    description = description[1..-1]
    description = description.lstrip
    conditions = doc.css("div#observed-spot-conditions").text



    HomeBreak::Break.new(name, height, description, conditions)
  end
end
