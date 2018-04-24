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
    puts "WNW swell, selective S swell, light winds today"
    puts "New WNW swell mid week, light winds"
    puts "More NW swell and S swell for weekend"
    puts ""
  end

  def list_local
    #and the rest of the regional spots
    @breaks = HomeBreak::Break.today
  end

  def menu
    puts "Which local break do you wanna check?"

    input = nil
    while input != "exit"
      puts "Enter number or type exit when you're done."
      puts "To see the spots again type list."
      input = gets.strip.downcase
      case input
      when "1"
        puts "more info on spot 1"
      when "2"
        puts "more info on spot 2"
      when "list"
        list_local
      # else
      #   puts "Try again, mate."
      end
    end
  end

  def farewell
    puts "See you in the lineup!"
  end

end
