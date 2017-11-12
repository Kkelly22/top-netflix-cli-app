class TopNetflix::CLI

  def call
    welcome
    TopNetflix::Scraper.make_shows
    list_shows
    user_choice
  end

  def welcome
    puts ""
    puts "Today's Top Shows to Stream on Netflix"
    puts "--------------------------------------"
  end

  def list_shows
    Shows.all.each do  |show|
      puts "#{show.name}"
    end
    puts ""
  end

  def user_choice
    input = " "
    while input != "exit"
      puts "To view more information, please choose a show (1-8). To see the options, type list. To exit, type exit."
      input = gets.strip.downcase
      show = TopNetflix::Shows.find(input.to_i)

      if input.to_i > 0 && show != nil
        print_show
      elsif input == "list"
        list_shows
      elsif input == "exit"
        puts "Happy Streaming!"
      else
        puts "Not sure what you mean, try again."
      end
    end
  end

  def print_show
    puts "#{show.name} - #{show.release_date}"
    puts "Plot: #{show.plot}"
    puts "Pros: #{show.pros}"
    puts "Cons: #{show.cons}"
    puts ""
  end

end
