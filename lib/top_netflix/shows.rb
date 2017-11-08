class TopNetflix::Shows
  attr_accessor :name, :release_date, :pros, :cons, :plot

  def self.Today
  #  puts "1. Stranger Things"
  #  puts "2. Life in Pieces"

    show_1 = self.new
    show_1.name = "Stranger Things"
    show_1.release_date = "October 31, 2017"
    show_1.pros = "Edge of your seat sci-fi thriller"
    show_1.cons = "Have to wait a year for each season"
    show_1.plot = "Sci-Fi thriller about the upside down"

    show_2 = self.new
    show_2.name = "Life In Pieces"
    show_2.release_date = "November 3, 2017"
    show_2.pros = "Jokes that make you laugh every minute of watching"
    show_2.cons = "Short episodes"
    show_2.plot = "Whimsical comedy about a family unit of 4"

    [show_1, show_2]
  end

end
