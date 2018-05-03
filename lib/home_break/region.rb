class HomeBreak::Region
  attr_accessor :description

  @@all = []

  def self.all
    @@all
  end

  def initialize(description)
    @description = description

    @@all << self
  end
end
