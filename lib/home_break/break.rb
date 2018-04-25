class HomeBreak::Break
  attr_accessor :name
  def self.today
    #return instances of breaks
    # Break will have height, period, wind, tide
    puts "1. Ocean Beach Overview"
    puts "2. South Ocean Beach"
    puts "3. Pacifica/Lindamar"

    break_1 = self.new
    break_1.name = "Ocean Beach Overview"
  end


end
