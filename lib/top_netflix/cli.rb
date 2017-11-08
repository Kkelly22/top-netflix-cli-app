class TopNetflix::CLI

  def call
    welcome
    list_shows
    user_choice
  end

  def welcome
    puts "Today's Top Shows to Stream on Netflix"
    puts "--------------------------------------"
  end

  def list_shows   #this will scrape our website and list each show by name each.do
    @shows = TopNetflix::Shows.Today
    @shows.each.with_index(1) do  |show, i|
      puts "#{i}. #{show.name}"
    end
  end

  def user_choice
    input = " "
    while input != "exit"
      puts "To view more information, please choose a show (1-8). To see the options, type list. To exit, type exit."
      input = gets.strip.downcase

      if input.to_i > 0
        the_show = @shows[input.to_i - 1]
        puts "#{the_show.name} - #{the_show.release_date} - #{the_show.plot} - #{the_show.pros} - #{the_show.cons}"
      elsif input == "list"
        list_shows
      elsif input == "exit"
        puts "Happy streaming!"
      else
        puts "Not sure what you mean, try again"
      end
    end
  end

end
