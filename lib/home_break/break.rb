class HomeBreak::Break
  attr_accessor :name, :height, :description, :conditions
  def self.today
   self.scrape_breaks
  end

  def self.scrape_breaks
    breaks = []

    breaks << self.scrape_OBO
    breaks << self.scrape_SOB
    breaks << self.scrape_PCL

    breaks
  end

  def self.scrape_OBO
    doc = Nokogiri::HTML(open("http://www.surfline.com/surf-report/ocean-beach-overview-northern-california_4127/"))
    break_1 = self.new
     break_1.name = doc.search("h3")[6].text.split(' ')[3..-1].join(' ')
     break_1.height = doc.search("h2").last.text
     break_1.description = doc.css("span#observed-wave-description").last.text.delete("\n")
     break_1.description = break_1.description[1..-1]
     break_1.description = break_1.description.lstrip
     break_1.conditions = doc.css("div#observed-spot-conditions").text


     break_1
  end

  def self.scrape_SOB
    doc = Nokogiri::HTML(open("http://www.surfline.com/surf-report/south-ocean-beach-northern-california_4128/"))
    break_2 = self.new
     break_2.name = doc.search("h3")[6].text.split(' ')[3..-1].join(' ')
     break_2.height = doc.search("h2").last.text
     break_2.description = doc.css("span#observed-wave-description").last.text.delete("\n")
     break_2.description = break_2.description[1..-1]
     break_2.description = break_2.description.lstrip
     break_2.conditions = doc.css("div#observed-spot-conditions").text


    break_2
  end

  def self.scrape_PCL
    doc = Nokogiri::HTML(open("http://www.surfline.com/surf-report/pacifica-lindamar-northern-california_5013/"))
    break_3 = self.new
    break_3.name = doc.search("h3")[6].text.split(' ')[3..-1].join(' ')
    break_3.height = doc.search("h2").last.text
    break_3.description = doc.css("span#observed-wave-description").last.text.delete("\n")
    break_3.description = break_3.description[1..-1]
    break_3.description = break_3.description.lstrip
    break_3.conditions = doc.css("div#observed-spot-conditions").text



    break_3
  end


end
