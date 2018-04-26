class HomeBreak::Break
  attr_accessor :name, :height, :period, :wind, :tide
  def self.today
    #return instances of breaks
    # Break will have height, period, wind, tide
    # puts "1. Ocean Beach Overview"
    # puts "2. South Ocean Beach"
    # puts "3. Pacifica/Lindamar"
    # now this method needs to return an array of objects

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
    # doc = Nokogiri::HTML(open(http://www.surfline.com/surf-report/ocean-beach-overview-northern-california_4127/))
    break_1 = self.new
     break_1.name = "Ocean Beach Overview"
     break_1.height = "5-7 ft"
     break_1.period = "11s"
     break_1.wind = "9 kts WSW (257˚)"
     break_1.tide = "3.0ft"

     break_1
  end

  def self.scrape_SOB
    break_2 = self.new
    break_2.name = "South Ocean Beach"
    break_2.height = "5-6 ft"
    break_2.period = "10s"
    break_2.wind = "8 kts WSW (256˚)"
    break_2.tide = "2.0ft"

    break_2
  end

  def self.scrape_PCL
    break_3 = self.new
    break_3.name = "Pacifica/Lindamar"
    break_3.height = "4-5 ft"
    break_3.period = "9s"
    break_3.wind = "7 kts WSW (246˚)"
    break_3.tide = "1.0ft"

    break_3
  end


end
