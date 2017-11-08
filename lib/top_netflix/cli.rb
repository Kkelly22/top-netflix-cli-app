class TopNetflix::CLI

  def call
    welcome
    list_shows
    user_choice
  end

  def welcome
    puts ""
    puts "Today's Top Shows to Stream on Netflix"
    puts "--------------------------------------"
  end

  def list_shows   #this will scrape our website and list each show by name each.do
    @shows = TopNetflix::Shows.Today
    @shows.each do  |show|
      puts "#{show.name}"
    end
    puts ""
  end

  def user_choice
    input = " "
    while input != "exit"
      puts "To view more information, please choose a show (1-8). To see the options, type list. To exit, type exit."
      input = gets.strip.downcase

      if input.to_i > 0 && input.to_i < 9
        the_show = @shows[input.to_i - 1]
        puts "#{the_show.name} - #{the_show.release_date}"
        puts "Plot: #{the_show.plot}"
        puts "Pros: #{the_show.pros}"
        puts "Cons: #{the_show.cons}"
        puts ""
      elsif input == "list"
        list_shows
      elsif input == "exit"
        puts "Happy streaming!"
      else
        puts "Not sure what you mean, try again."
      end
    end
  end

end
