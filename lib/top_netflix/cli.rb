class TopNetflix::CLI

  def call
    welcome
    list_shows
    user_choice
  end

  def welcome
    puts "Top Shows to Stream on Netflix"
    puts "------------------------------"
  end

  def list_shows   #this will scrape our website and list each show by name each.do
    @shows = TopNetflix::Shows.Today
  end

  def user_choice
    input = " "
    while input != "exit"
      puts "To view more information, please choose a show (1-8). To see the options, type list. To exit, type exit."
      input = gets.strip

      if input.to_i > 0
        show_details(input)
      elsif input == "list"
        list_shows
      elsif input == "exit"
        puts "Happy streaming!"
      else
        puts "Not sure what you mean, try again"
        list_shows
      end
    end
  end

  def show_details(input)   #this will show individual shows attributes based on name
    if input == "1"
      puts "Season Release: Nov 3, 2017.  Pros: Cons: Plot:"
    elsif input == "2"
      puts "Season Release: October 31, 2017.  Pros: Cons: Plot:"
    else
      puts "Do not have information on that choice, try another."
    end
  end

end
