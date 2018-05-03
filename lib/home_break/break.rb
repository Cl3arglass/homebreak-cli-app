class HomeBreak::Break
  attr_accessor :name, :height, :description, :conditions

  @@all = []

  def self.all
    @@all
  end

  def initialize(name, height, description, conditions)

    @name = name
    @height = height
    @description = description
    @conditions = conditions

    @@all << self

  end

  




end
