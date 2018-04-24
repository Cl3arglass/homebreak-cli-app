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
    puts "1. Fort Point"
    puts "2. Ocean Beach Overview"
    #and the rest of the regional spots
  end

  def menu
    puts "Which local spot do you wanna check?"
    puts "Enter number or type exit when you're done"

    input = nil
    while input != "exit"
      input = gets.strip.downcase
      case input
      when "1"
        puts "more info on spot 1"
      when "2"
        puts "more info on spot 2"
      end
    end
  end

  def farewell
    puts "See you in the lineup!"
  end

end
