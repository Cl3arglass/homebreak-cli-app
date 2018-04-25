# CLI Controller
class HomeBreak::CLI

  def call
    puts "Welcome to HomeBreak!"
    list_regional
    list_local
    menu
    farewell
  end

  def list_regional
    puts "Today's Regional Forecast for SF - San Mateo County"
    puts ""
    @forecast = HomeBreak::Region.today
    puts ""
  end

  def list_local
    #and the rest of the regional spots
    @breaks = HomeBreak::Break.today
    @breaks.each.with_index(1) do |beach, i|
      puts "#{i}. #{beach.name}"
    end
    puts ""
  end

  def menu
    puts "Which local break do you wanna check?"
# update cli to use objects
    input = nil
    while input != "exit"
      puts "Enter number or type exit when you're done."
      puts "To see the spots again type list."
      input = gets.strip.downcase

      if input.to_i > 0 && input.to_i <= 3
        the_beach = @breaks[input.to_i-1]
        puts ""
        puts "#{the_beach.name}:"
        puts "Height #{the_beach.height}"
        puts "Period #{the_beach.period}"
        puts "Wind #{the_beach.wind}"
        puts "Tide #{the_beach.tide}"
        puts ""
      elsif input == "list"
        puts ""
        list_local
      elsif input != "exit"
        puts "Try again, mate."
      end
    end
  end

  def farewell
    puts "See you in the lineup!"
  end

end
