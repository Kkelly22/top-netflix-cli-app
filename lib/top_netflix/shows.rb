class TopNetflix::Shows
  attr_accessor :name, :release_date, :plot, :pros, :cons

  def self.Today
    url = "https://www.huffingtonpost.com/entry/netflix-streamline_us_59f9e246e4b046017fb05974"
    html = open(url)
    doc = Nokogiri::HTML(html)
    i = 0
    until i > 8
      show = self.new
      show.name = doc.css(".card__badge")[i].text
      show.release_date = doc.css(".card__headline")[i].text
      show_details = doc.css(".card__description")[i].text
      show_details_formatted = show_details.split.join(" ").gsub("\u00A0", " ")
      show.plot = show_details_formatted.split(".")[0]
      show.pros = show_details_formatted.split(".")[1]
      show.cons = show_details_formatted.split(".")[2]
      i += 1
    end




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
